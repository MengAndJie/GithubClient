//
//  ZLSearchView.swift
//  ZLGitHubClient
//
//  Created by 朱猛 on 2019/8/3.
//  Copyright © 2019 ZM. All rights reserved.
//

import UIKit

enum ZLSearchViewEventType : Int
{
    case filterButtonClicked
}

class ZLSearchView: ZLBaseView {

    @IBOutlet private weak var topViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet private weak var backButtonWidthConstraint: NSLayoutConstraint!

    @IBOutlet private weak var cancelButtonWidthConstraint: NSLayoutConstraint!
 
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var cancelButton: UIButton!
    
    
    @IBOutlet weak var filterBackViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var filterBackView: UIView!
    @IBOutlet weak var filterContentView: UIView!
    @IBOutlet weak var filterContentViewTrailingConstraint: NSLayoutConstraint!
    
    var searchRecordView : ZLSearchRecordView?
    var searchItemsView: ZLSearchItemsView?
    var searchFilterView : UIView?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.topViewHeightConstraint.constant = self.topViewHeightConstraint.constant + ZLStatusBarHeight
        self.filterBackViewTopConstraint.constant = self.filterBackViewTopConstraint.constant + ZLStatusBarHeight
        
        // ZLSearchItemsView
        self.searchItemsView = Bundle.main.loadNibNamed("ZLSearchItemsView", owner: self, options: nil)?.first as? ZLSearchItemsView
        self.searchItemsView?.frame = self.contentView.bounds
        self.searchItemsView?.autoresizingMask = UIViewAutoresizing.init(rawValue: UIViewAutoresizing.flexibleHeight.rawValue | UIViewAutoresizing.flexibleWidth.rawValue)
        if self.searchItemsView != nil
        {
            self.contentView.addSubview(self.searchItemsView!)
        }
        
        // ZLSearchRecordView
        self.searchRecordView = Bundle.main.loadNibNamed("ZLSearchRecordView", owner: self, options: nil)?.first as? ZLSearchRecordView
        self.searchRecordView?.frame = self.contentView.bounds
        self.searchRecordView?.autoresizingMask = UIViewAutoresizing.init(rawValue: UIViewAutoresizing.flexibleHeight.rawValue | UIViewAutoresizing.flexibleWidth.rawValue)
        if self.searchRecordView != nil
        {
            self.contentView.addSubview(self.searchRecordView!)
        }
        self.searchRecordView?.isHidden = true
        
        // ZLSearchFilterView
        self.filterBackView.isHidden = true
        let gestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(hiddenFilterView))
        self.filterBackView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    
    func setEditStatus()
    {
       self.backButtonWidthConstraint.constant = 0.0
        self.cancelButtonWidthConstraint.constant = 40.0
        self.searchRecordView?.isHidden = false
    }
    
    func setUnEditStatus()
    {
        self.backButtonWidthConstraint.constant = 30.0
        self.cancelButtonWidthConstraint.constant = 0.0
        self.searchRecordView?.isHidden = true
    }

    func showFilterView(delegate : NSObject)
    {
        let filterView = Bundle.main.loadNibNamed("ZLSearchFilterViewForUser", owner: nil, options: nil)?.first as? ZLSearchFilterViewForUser
        filterView?.frame = self.filterContentView.bounds
        filterView?.autoresizingMask = UIViewAutoresizing.init(rawValue: UIViewAutoresizing.flexibleHeight.rawValue | UIViewAutoresizing.flexibleWidth.rawValue)
        self.searchFilterView = filterView
        self.filterContentView.addSubview(filterView!)
        
        self.filterBackView.isHidden = false
        
        UIView.animate(withDuration: 1.0, animations: {
            self.filterContentViewTrailingConstraint.constant = 300
        })
        
        
    }
    
    @objc func hiddenFilterView()
    {
        self.searchFilterView?.removeFromSuperview()
        self.searchFilterView = nil
        
        self.filterBackView.isHidden = true
        
        UIView.animate(withDuration: 1.0, animations: {
            self.filterContentViewTrailingConstraint.constant = 0
        })
    }
    
}
