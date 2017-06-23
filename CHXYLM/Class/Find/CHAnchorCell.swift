//
//  CHAnchorCell.swift
//  CHXYLM
//
//  Created by Laurence on 2017/6/22.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import SnapKit

class CHAnchorCell: UITableViewCell {
    
    var modelArray :[CHAnchorListModel] {
        
        get{
           
            return [CHAnchorListModel]()
        }
        
        set(newModelArray){
           
            iconImage .sd_setImage(with: URL.init(string: newModelArray[0].middleLogo!))
            iconImage1 .sd_setImage(with: URL.init(string: newModelArray[1].middleLogo!))
            iconImage2.sd_setImage(with: URL.init(string: newModelArray[2].middleLogo!))
        
            nickname.text = newModelArray[0].nickname
            nickname1.text = newModelArray[1].nickname
            nickname2.text = newModelArray[2].nickname
            
            describeLabel.text = newModelArray[0].personDescribe
            describeLabel1.text = newModelArray[1].personDescribe
            describeLabel2.text = newModelArray[2].personDescribe
            
        }
    }
    
    
    lazy var bgView: UIView = {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        return view
    }()
    lazy var bgView1: UIView = {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        return view
    }()
    lazy var bgView2: UIView = {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        view.layer.shadowOpacity = 0.8
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    lazy var iconImage1: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    lazy var iconImage2: UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
    
    lazy var nickname: UILabel = {
        
         let label = UILabel.init()
        label.text = "test"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    lazy var nickname1: UILabel = {
        
        let label = UILabel.init()
        label.text = "test"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    lazy var nickname2: UILabel = {
        
        let label = UILabel.init()
        label.text = "test"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    lazy var describeLabel: UILabel = {
        let label = UILabel.init()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.text = "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        return label
    }()
    lazy var describeLabel1: UILabel = {
        let label = UILabel.init()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.text = "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        label.textAlignment = .center
        return label
    }()
    lazy var describeLabel2: UILabel = {
        let label = UILabel.init()
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.text = "ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss"
        label.textAlignment = .center
        return label
    }()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(self.bgView)
        bgView.addSubview(self.iconImage)
        bgView.addSubview(self.nickname)
        contentView.addSubview(self.describeLabel)
        
        contentView.addSubview(self.bgView1)
        bgView1.addSubview(self.iconImage1)
        bgView1.addSubview(self.nickname1)
        contentView.addSubview(self.describeLabel1)
        
        contentView.addSubview(self.bgView2)
        bgView2.addSubview(self.iconImage2)
        bgView2.addSubview(self.nickname2)
        contentView.addSubview(self.describeLabel2)
        
        let imgW = (kScreenW-20-40)/3
        let imgH = imgW*1.2
        
        bgView.snp.makeConstraints { (make) in
            
            
            make.top.equalTo(5)
            make.left.equalTo(10)
            make.size.equalTo(CGSize(width: imgW, height: imgH))
            
        }
        
        iconImage.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(2)
            make.right.equalTo(-2)
            make.height.equalTo(imgW-4)
        }
        
        nickname.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView)
            make.top.equalTo(iconImage.snp.bottom).offset(3)
        }
        
        describeLabel.snp.makeConstraints { (make) in
            
            make.top.equalTo(bgView.snp.bottom).offset(10)
            make.left.right.equalTo(bgView)
            make.bottom.equalTo(-10)
        }
        
        
        bgView1.snp.makeConstraints { (make) in
            
            make.bottom.size.top.equalTo(bgView)
            make.left.equalTo(bgView.snp.right).offset(20)
        }
        
        iconImage1.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(2)
            make.right.equalTo(-2)
            make.height.equalTo(imgW-4)
        }
        
        nickname1.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView1)
            make.top.equalTo(iconImage1.snp.bottom).offset(3)
        }
        
        describeLabel1.snp.makeConstraints { (make) in
            
            make.top.equalTo(bgView1.snp.bottom).offset(10)
            make.left.right.equalTo(bgView1)
            make.bottom.equalTo(-10)
        }
        
        bgView2.snp.makeConstraints { (make) in
            
            make.bottom.size.top.equalTo(bgView)
            make.left.equalTo(bgView1.snp.right).offset(20)
        }
        
        iconImage2.snp.makeConstraints { (make) in
            
            make.top.left.equalTo(2)
            make.right.equalTo(-2)
            make.height.equalTo(imgW-4)
        }
        
        nickname2.snp.makeConstraints { (make) in
            make.centerX.equalTo(bgView2)
            make.top.equalTo(iconImage2.snp.bottom).offset(3)
        }
        
        describeLabel2.snp.makeConstraints { (make) in
            
            make.top.equalTo(bgView2.snp.bottom).offset(10)
            make.left.right.equalTo(bgView2)
            make.bottom.equalTo(-10)
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
