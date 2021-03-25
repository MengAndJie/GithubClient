//
//  ZLPullRequestHeaderTableViewCell.swift
//  ZLGitHubClient
//
//  Created by 朱猛 on 2021/3/24.
//  Copyright © 2021 ZM. All rights reserved.
//

import UIKit

protocol ZLPullRequestHeaderTableViewCellDelegate : NSObjectProtocol {
   
    func getPRAuthorAvatarURL() -> String
    func getPRRepoFullName() -> String
    func getPRNumber() -> Int
    func getPRState() -> String
    func getPRTitle() -> String
    
    func getCommitNumber() -> Int
    func getFileChangedNumber() -> Int
    func getAdditionFileNumber() -> Int
    func getDeletedFileNumber() -> Int
    func getRef() -> String

}

class ZLPullRequestHeaderTableViewCell: UITableViewCell {
    
    var avatarImageView : UIImageView!
    var fullNameLabel : UILabel!
    var numberLabel: UILabel!
    var titleLabel: UILabel!
    
    var refLabel: UILabel!
    var statusLabel: UILabel!
    
    var fileChangedLabel : UILabel!
    var commitLabel : UILabel!
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }
    
    func setUpUI(){
        
        self.selectionStyle = .none
        
        self.contentView.backgroundColor = UIColor(named: "ZLIssueCommentCellColor")
        
        let imageView = UIImageView()
        imageView.cornerRadius = 15
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview().offset(20)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        avatarImageView = imageView
        
        let label1 = UILabel()
        label1.textColor = UIColor(named: "ZLLabelColor1")
        label1.font = UIFont(name: Font_PingFangSCMedium, size: 14)
        self.contentView.addSubview(label1)
        label1.snp.makeConstraints { (make) in
            make.left.equalTo(avatarImageView.snp.right).offset(10)
            make.centerY.equalTo(avatarImageView)
        }
        fullNameLabel = label1
        
        let label2 = UILabel()
        label2.textColor = UIColor(named: "ZLLabelColor2")
        label2.font = UIFont(name: Font_PingFangSCRegular, size: 14)
        self.contentView.addSubview(label2)
        label2.snp.makeConstraints { (make) in
            make.left.equalTo(fullNameLabel.snp.right).offset(10)
            make.centerY.equalTo(avatarImageView)
        }
        numberLabel = label2
        
        let label3 = UILabel()
        label3.textColor = UIColor(named: "ZLLabelColor1")
        label3.font = UIFont(name: Font_PingFangSCSemiBold, size: 20)
        label3.numberOfLines = 0
        self.contentView.addSubview(label3)
        label3.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(avatarImageView.snp.bottom).offset(10)
        }
        titleLabel = label3
        
        let scrollView = UIScrollView()
        self.contentView.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(25)
            make.right.equalToSuperview().offset(-25)
            make.top.equalTo(label3.snp.bottom).offset(10)
        }
        
        
        let label4 = UILabel()
        label4.textColor = UIColor(named: "ZLPRRefColor")
        label4.font = UIFont(name: Font_PingFangSCRegular, size: 14)
        scrollView.addSubview(label4)
        label4.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalToSuperview()
        }
        refLabel = label4
        
        
        let label5 = UILabel()
        label5.font = UIFont(name: Font_PingFangSCMedium, size: 12)
        label5.borderWidth = 1 / 3
        label5.cornerRadius = 8
        label5.textAlignment = .center
        self.contentView.addSubview(label5)
        label5.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(scrollView.snp.bottom).offset(10)
            make.width.equalTo(60)
            make.height.equalTo(25)
        }
        statusLabel = label5
        
        
        let lineview1 = UIView()
        lineview1.backgroundColor = UIColor(named: "ZLSeperatorLineColor")
        self.contentView.addSubview(lineview1)
        lineview1.snp.makeConstraints { (make) in
            make.top.equalTo(statusLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview()
            make.height.equalTo(1.0 / 2)
        }
        
        
        let filebutton = UIButton(type: .custom)
        filebutton.backgroundColor = UIColor(named: "ZLIssueCommentCellColor")
        self.contentView.addSubview(filebutton)
        filebutton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(lineview1.snp.bottom)
        }
        
        let fileButtonLabel = UILabel()
        fileButtonLabel.numberOfLines = 0
        filebutton.addSubview(fileButtonLabel)
        fileButtonLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20))
        }
        fileChangedLabel = fileButtonLabel
        
        let fileButtonImageView = UIImageView()
        fileButtonImageView.image = UIImage(named: "Next_MyProfile")
        filebutton.addSubview(fileButtonImageView)
        fileButtonImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 5, height: 9))
        }
        
        let lineview2 = UIView()
        lineview2.backgroundColor = UIColor(named: "ZLSeperatorLineColor")
        self.contentView.addSubview(lineview2)
        lineview2.snp.makeConstraints { (make) in
            make.top.equalTo(filebutton.snp.bottom)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview()
            make.height.equalTo(1.0 / 2)
        }
        
        
        let commitButton = UIButton(type: .custom)
        commitButton.backgroundColor = UIColor(named: "ZLIssueCommentCellColor")
        self.contentView.addSubview(commitButton)
        commitButton.snp.makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(lineview2.snp.bottom)
            make.height.equalTo(filebutton.snp.height)
            make.bottom.equalToSuperview()
        }
        
        let commitButtonLabel = UILabel()
        commitButtonLabel.numberOfLines = 0
        commitButtonLabel.font = UIFont(name: Font_PingFangSCRegular, size: 14)
        commitButtonLabel.textColor = UIColor(named: "ZLLabelColor1")
        commitButton.addSubview(commitButtonLabel)
        commitButtonLabel.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(UIEdgeInsets(top:15, left: 20, bottom: 15, right: 20))
        }
        commitLabel = commitButtonLabel
        
        let commitButtonImageView = UIImageView()
        commitButtonImageView.image = UIImage(named: "Next_MyProfile")
        commitButton.addSubview(commitButtonImageView)
        commitButtonImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-20)
            make.size.equalTo(CGSize(width: 5, height: 9))
        }
        
    }
    
    func fillWithData(data : ZLPullRequestHeaderTableViewCellDelegate) {
     
        avatarImageView.sd_setImage(with: URL(string: data.getPRAuthorAvatarURL()), placeholderImage: UIImage(named: "default_avatar"))
        fullNameLabel.text = data.getPRRepoFullName()
        numberLabel.text = "#\(data.getPRNumber())"
        titleLabel.text = data.getPRTitle()
        
        let fileChangedStr = NSMutableAttributedString(string: "\(data.getFileChangedNumber()) file changed", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ZLLabelColor1")! ,NSAttributedString.Key.font : UIFont(name: Font_PingFangSCRegular, size: 14)!])
        if data.getFileChangedNumber() > 0 {
            fileChangedStr.append(NSAttributedString(string: "\n"))
        }
        
        if data.getAdditionFileNumber() > 0 {
            let addition = NSMutableAttributedString(string: "+\(data.getAdditionFileNumber()) ", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ZLPROpenedColor")!,NSAttributedString.Key.font : UIFont(name: Font_PingFangSCRegular, size: 14)!])
            fileChangedStr.append(addition)
        }
        if data.getDeletedFileNumber() > 0 {
            let deleted = NSMutableAttributedString(string: "-\(data.getDeletedFileNumber())", attributes: [NSAttributedString.Key.foregroundColor : UIColor(named: "ZLPRClosedColor")! ,NSAttributedString.Key.font : UIFont(name: Font_PingFangSCRegular, size: 14)!])
            fileChangedStr.append(deleted)
        }
        fileChangedLabel.attributedText = fileChangedStr
        
        commitLabel.text = "\(data.getCommitNumber()) commit"
        
        refLabel.text = data.getRef()
        
        
        statusLabel.text = data.getPRState()
        if statusLabel.text == "OPEN" {
            statusLabel.textColor = UIColor(named: "ZLPROpenedColor")
            statusLabel.backgroundColor = UIColor(named: "ZLPROpenedBackColor")
            statusLabel.borderColor = UIColor(named: "ZLPROpenedColor")
        } else if statusLabel.text == "CLOSED" {
            statusLabel.textColor = UIColor(named: "ZLPRClosedColor")
            statusLabel.backgroundColor = UIColor(named: "ZLPRClosedBackColor")
            statusLabel.borderColor = UIColor(named: "ZLPRClosedColor")
        } else if statusLabel.text == "MERGED" {
            statusLabel.textColor = UIColor(named: "ZLPRMergedColor")
            statusLabel.backgroundColor = UIColor(named: "ZLPRMergedBackColor")
            statusLabel.borderColor = UIColor(named: "ZLPRMergedColor")
        }
     }


}
