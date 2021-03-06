//
//  ZLRepoInfoViewModel.swift
//  ZLGitHubClient
//
//  Created by 朱猛 on 2019/8/19.
//  Copyright © 2019 ZM. All rights reserved.
//

import UIKit

enum ZLRepoInfoItemType : Int {
    case file                   // 仓库文件
    case pullRequest            // pullrequest
    case branch                 // 分支
}

class ZLRepoInfoViewModel: ZLBaseViewModel {
    
    // view
    private var repoInfoView : ZLRepoInfoView!
    
    // model
    private var repoInfoModel : ZLGithubRepositoryModel!
    
    private var currentBranch: String?
    
    
    // subViewModel
    private var repoHeaderInfoViewModel : ZLRepoHeaderInfoViewModel!

    
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: ZLLanguageTypeChange_Notificaiton, object: nil)
        NotificationCenter.default.removeObserver(self, name: ZLUserInterfaceStyleChange_Notification, object: nil)
    }
    
    override func bindModel(_ targetModel: Any?, andView targetView: UIView) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(onNotificationArrived(notification:)), name: ZLLanguageTypeChange_Notificaiton, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onNotificationArrived(notification:)), name: ZLUserInterfaceStyleChange_Notification, object: nil)
        
        guard let view = targetView as? ZLRepoInfoView else {
            ZLLog_Warn("targetView is not ZLRepoInfoView")
            return
        }
        repoInfoView = view
        
        guard let model = targetModel as? ZLGithubRepositoryModel else {
            ZLLog_Warn("targetModel is not ZLGithubRepositoryModel,so return")
            return
        }
        repoInfoModel = model
        
        if let vc = self.viewController {
            vc.zlNavigationBar.backButton.isHidden = false
            let button = UIButton.init(type: .custom)
            button.setImage(UIImage.init(named: "run_more"), for: .normal)
            button.frame = CGRect.init(x: 0, y: 0, width: 60, height: 60)
            button.addTarget(self, action: #selector(onMoreButtonClick(button:)), for: .touchUpInside)
            
            vc.zlNavigationBar.rightButton = button
        }
        
        
      
        self.setViewDataForRepoInfoView()
    }
}

extension ZLRepoInfoViewModel
{
    func setViewDataForRepoInfoView(){
        
        self.viewController?.title = self.repoInfoModel?.name ?? ZLLocalizedString(string: "repository", comment: "")
       
        repoHeaderInfoViewModel = ZLRepoHeaderInfoViewModel()
        self.addSubViewModel(repoHeaderInfoViewModel)
        
        // 从服务器查询
        let tmpRepoInfo = ZLServiceManager.sharedInstance.repoServiceModel?.getRepoInfo(withFullName: repoInfoModel.full_name!,
                                                                      serialNumber: NSString.generateSerialNumber())
        {[weak self] (resultModel) in
            if resultModel.result == true, let repoInfoModel = resultModel.data as? ZLGithubRepositoryModel {
               
                self?.viewController?.title = repoInfoModel.name ?? ZLLocalizedString(string: "repository", comment: "")
                self?.repoInfoModel = repoInfoModel
                self?.repoHeaderInfoViewModel.update(repoInfoModel)
                self?.repoInfoView.reloadData()
                
            } else if resultModel.result == false, let errorModel = resultModel.data as? ZLGithubRequestErrorModel{
                
                ZLToastView.showMessage("get repo info failed [\(errorModel.statusCode)](\(errorModel.message)")
                
            } else {
                
                ZLToastView.showMessage("invalid repo info format")
                
            }
        }
        
        if tmpRepoInfo != nil {
            repoInfoModel = tmpRepoInfo!
        }
        
        repoHeaderInfoViewModel.bindModel(repoInfoModel, andView: repoInfoView.headerView!)
        
        repoInfoView.fillWithData(delegate: self)
        
    }
}

extension ZLRepoInfoViewModel
{
    @objc func onNotificationArrived(notification: Notification)
    {
        switch(notification.name)
        {
        case ZLLanguageTypeChange_Notificaiton:do{
            self.repoInfoView?.justUpdate()
        }
        case ZLUserInterfaceStyleChange_Notification:do{
            self.repoInfoView?.readMeView?.reRender()
        }
        default:
            break;
        }
    }
    
    @objc func onMoreButtonClick(button : UIButton) {
        
        if self.repoInfoModel.html_url == nil {
            return
        }
        
        let alertVC = UIAlertController.init(title: self.repoInfoModel?.full_name, message: nil, preferredStyle: .actionSheet)
        alertVC.popoverPresentationController?.sourceView = button
        let alertAction1 = UIAlertAction.init(title:ZLLocalizedString(string: "View in Github", comment: ""), style: UIAlertAction.Style.default) { (action : UIAlertAction) in
            let webContentVC = ZLWebContentController.init()
            webContentVC.requestURL = URL.init(string: self.repoInfoModel.html_url!)
            self.viewController?.navigationController?.pushViewController(webContentVC, animated: true)
        }
        let alertAction2 = UIAlertAction.init(title: ZLLocalizedString(string: "Open in Safari", comment: ""), style: UIAlertAction.Style.default) { (action : UIAlertAction) in
            let url =  URL.init(string: self.repoInfoModel.html_url!)
            if url != nil {
                UIApplication.shared.open(url!, options: [:], completionHandler: {(result : Bool) in})
            }
        }
        
        let alertAction3 = UIAlertAction.init(title: ZLLocalizedString(string: "Share", comment: ""), style: UIAlertAction.Style.default) { (action : UIAlertAction) in
            let url =  URL.init(string: self.repoInfoModel.html_url!)
            if url != nil {
                let activityVC = UIActivityViewController.init(activityItems: [url!], applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = button
                activityVC.excludedActivityTypes = [.message,.mail,.openInIBooks,.markupAsPDF]
                self.viewController?.present(activityVC, animated: true, completion: nil)
            }
        }
        
        let alertAction4 = UIAlertAction.init(title: ZLLocalizedString(string: "Cancel", comment: ""), style: UIAlertAction.Style.cancel, handler: nil)
        
        alertVC.addAction(alertAction1)
        alertVC.addAction(alertAction2)
        alertVC.addAction(alertAction3)
        alertVC.addAction(alertAction4)
        
        self.viewController?.present(alertVC, animated: true, completion: nil)
        
    }
}






extension ZLRepoInfoViewModel : ZLRepoInfoViewDelegate
{
    var fullName: String? {
        repoInfoModel.full_name
    }

    var branch: String? {
        if currentBranch != nil {
            return currentBranch
        } else {
            return repoInfoModel.default_branch
        }
    }
    
    var language: String? {
        repoInfoModel.language
    }
    
     func onZLRepoItemInfoViewEvent(type : ZLRepoItemType){
        
        if self.repoInfoModel == nil ||
            self.repoInfoModel.full_name == nil {
            return
        }
        
        switch(type)
        {
        case .action : do{
            let workflowVC = ZLRepoWorkflowsController.init()
            workflowVC.repoFullName = self.repoInfoModel.full_name
            self.viewController?.navigationController?.pushViewController(workflowVC, animated: true)
            }
        case .branch :do{
            if repoInfoModel.default_branch == nil {
                return
            }
            
            ZLRepoBranchesView.showRepoBranchedView(repoFullName: repoInfoModel.full_name!,
                                                    currentBranch: self.currentBranch ?? self.repoInfoModel.default_branch!)
            {(branch: String) in
                self.currentBranch = branch
                self.repoInfoView.reloadData()
                self.repoInfoView.readMeView?.startLoad(fullName: self.repoInfoModel.full_name ?? "", branch: branch)
            }
        }
        case .pullRequest : do{
            let controller = ZLRepoPullRequestController.init()
            controller.repoFullName = self.repoInfoModel?.full_name
            self.viewController?.navigationController?.pushViewController(controller, animated: true)
            }
        case .code : do{
            let controller = ZLRepoContentController()
            controller.branch = self.currentBranch ?? self.repoInfoModel?.default_branch
            controller.repoFullName = self.repoInfoModel?.full_name
            controller.path = ""
            self.viewController?.navigationController?.pushViewController(controller, animated: true)
            }
        case .commit : do{
            let controller = ZLRepoCommitController.init()
            controller.repoFullName = repoInfoModel.full_name!
            controller.branch = self.currentBranch ?? self.repoInfoModel.default_branch
            self.viewController?.navigationController?.pushViewController(controller, animated: true)
            }
        case .language : do{
            ZLRepoLanguagesPercentView.showRepoLanguagesPercentView(fullName: self.repoInfoModel?.full_name ?? "")
            }
        }
    }
    
    
    func onLinkClicked(url : URL?) -> Void{
        if let realurl = url {
            ZLUIRouter.openURL(url: realurl)
        }
    }
}

