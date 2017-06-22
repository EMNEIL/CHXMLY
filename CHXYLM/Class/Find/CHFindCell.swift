//
//  CHFindCell.swift
//  CHXYLM
//
//  Created by Laurence on 2017/6/15.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import SnapKit
class CHFindCell: UITableViewCell {
  
    lazy var moreButton :UIButton = {
       
       let button = UIButton.init()
        button.setImage(UIImage.init(named: "liveRadioSectionMore_Normal"), for: .normal)
        
        return button
    }()
    
    lazy var logoImageView:UIImageView = {
    
         let imageView = UIImageView.init()
         imageView.image = UIImage.init(named: "findsection_logo")
        return imageView
    }()
    
    lazy var title:UILabel = {
    
          var label = UILabel.init()
          label.text = "付费精品"
          label.font = UIFont.systemFont(ofSize: 12)
          label.textColor = UIColor.gray
        return label
    }()
    
    lazy var iconImageView1:UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "find_usercover")
        return imageView
    }()
    lazy var iconImageView2:UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "find_usercover")
        return imageView
    }()
    lazy var iconImageView3:UIImageView = {
        
        let imageView = UIImageView.init()
        imageView.image = UIImage.init(named: "find_usercover")
        return imageView
    }()
    
    lazy var contentLabel1:UILabel = {
        
        var label = UILabel.init()
        label.text = "马薇薇:被人鄙视,如何反击?"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor.gray
        return label
    }()
    lazy var contentLabel2:UILabel = {
        
        var label = UILabel.init()
        label.text = "马薇薇:被人鄙视,如何反击?"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor.gray
        return label
    }()
    lazy var contentLabel3:UILabel = {
        
        var label = UILabel.init()
        label.text = "马薇薇:被人鄙视,如何反击?"
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor.gray
        return label
    }()
    
    lazy var subContentLabel1:UILabel = {
       
        var label = UILabel.init()
        label.text = "马东携奇葩说"
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    lazy var subContentLabel2:UILabel = {
        
        var label = UILabel.init()
        label.text = "马东携奇葩说"
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    lazy var subContentLabel3:UILabel = {
        
        var label = UILabel.init()
        label.text = "马东携奇葩说"
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 11)
        return label
    }()
    
    var model:CHRecommandModel {
      
        get{
           
            return CHRecommandModel()
        }
        
        set(newModel){
          
            let listArray:[CHRecommandHeaderModel] = newModel.list!
            
            title.text = newModel.title
            
            iconImageView1.sd_setImage(with: URL.init(string:listArray[0].albumCoverUrl290! ))
            contentLabel1.text = listArray[0].intro!
            subContentLabel1.text  = listArray[0].nickname!
            
            iconImageView2.sd_setImage(with: URL.init(string:listArray[1].albumCoverUrl290! ))
            contentLabel2.text = listArray[1].intro!
            subContentLabel2.text  = listArray[1].nickname!
            
            iconImageView3.sd_setImage(with: URL.init(string:listArray[2].albumCoverUrl290! ))
            contentLabel3.text = listArray[2].intro!
            subContentLabel3.text  = listArray[2].nickname!
            
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.moreButton)
        self.contentView.addSubview(self.logoImageView)
        self.contentView.addSubview(self.title)
        
        self.contentView.addSubview(self.iconImageView1)
        self.contentView.addSubview(self.iconImageView2)
        self.contentView.addSubview(self.iconImageView3)
        
        self.contentView.addSubview(self.contentLabel1)
        self.contentView.addSubview(self.contentLabel2)
        self.contentView.addSubview(self.contentLabel3)
        self.contentView.addSubview(self.subContentLabel1)
        self.contentView.addSubview(self.subContentLabel2)
        self.contentView.addSubview(self.subContentLabel3)
        
        moreButton.snp.makeConstraints { (make) in
           
            make.right.equalTo(self).offset(-10)
            make.width.equalTo(34)
            make.centerY.equalTo(logoImageView)
            make.height.equalTo(12)
        }
        logoImageView.snp.makeConstraints { (make) in
            make.top.equalTo(19)
            make.left.equalTo(10)
            make.width.height.equalTo(10)
        }
        
        title.snp.makeConstraints { (make) in
            make.centerY.equalTo(logoImageView)
            make.left.equalTo(logoImageView.snp.right).offset(5)
        }
        
        iconImageView1.snp.makeConstraints { (make) in
            make.left.equalTo(logoImageView)
            make.top.equalTo(title.snp.bottom).offset(10)
            make.width.height.equalTo((kScreenW-40)/3)
        }
        
        iconImageView2.snp.makeConstraints { (make) in
            
            make.top.equalTo(iconImageView1)
            make.size.equalTo(iconImageView1)
            make.left.equalTo(iconImageView1.snp.right).offset(10)
        }
        
        iconImageView3.snp.makeConstraints { (make) in
            make.top.equalTo(iconImageView1)
            make.size.equalTo(iconImageView1)
            make.left.equalTo(iconImageView2.snp.right).offset(10)
        }
        
        contentLabel1.snp.makeConstraints { (make) in
            make.left.right.equalTo(iconImageView1)
            make.top.equalTo(iconImageView1.snp.bottom).offset(12)
            make.height.equalTo(35)
        }
        contentLabel2.snp.makeConstraints { (make) in
            make.left.right.equalTo(iconImageView2)
            make.top.equalTo(iconImageView2.snp.bottom).offset(12)
            make.height.equalTo(35)
        }
        contentLabel3.snp.makeConstraints { (make) in
            make.left.right.equalTo(iconImageView3)
            make.top.equalTo(iconImageView3.snp.bottom).offset(12)
            make.height.equalTo(35)
        }
        
        subContentLabel1.snp.makeConstraints { (make) in
            
             make.left.right.equalTo(iconImageView1)
             make.top.equalTo(contentLabel1.snp.bottom).offset(5)
        }
        subContentLabel2.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(iconImageView2)
            make.top.equalTo(contentLabel2.snp.bottom).offset(5)
        }
        subContentLabel3.snp.makeConstraints { (make) in
            
            make.left.right.equalTo(iconImageView3)
            make.top.equalTo(contentLabel3.snp.bottom).offset(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
