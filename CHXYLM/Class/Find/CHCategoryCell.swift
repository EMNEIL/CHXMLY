//
//  CHCategoryCell.swift
//  CHXYLM
//
//  Created by Laurence on 2017/6/21.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import SnapKit
class CHCategoryCell: UITableViewCell {
    
    var modelAarray: [CHRecommandHeaderModel] {
        
        get{
          return [CHRecommandHeaderModel]()
        }
        
        set(newModelArray){
           
            logoImage1.sd_setImage(with: URL.init(string: newModelArray[0].coverPath!))
            tipLabel1.text = newModelArray[0].title!
            
            logoImage2.sd_setImage(with: URL.init(string: newModelArray[1].coverPath!))
            tipLabel2.text = newModelArray[1].title!
            
            
        }
    }
    lazy var logoImage1: UIImageView = {
        
        let imageView = UIImageView.init()
        
        return imageView
    }()
    
    lazy var logoImage2: UIImageView = {
        
        let imageView = UIImageView.init()
        
        return imageView
    }()
    
    lazy var tipLabel1: UILabel = {
        
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    lazy var tipLabel2: UILabel = {
        
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    contentView.addSubview(self.logoImage1)
    contentView.addSubview(self.logoImage2)
    contentView.addSubview(self.tipLabel1)
    contentView.addSubview(self.tipLabel2)
    
    logoImage1.snp.makeConstraints { (make) in
        
        make.centerY.equalTo(contentView)
        make.left.equalTo(20)
        make.size.equalTo(CGSize(width: 20, height: 20))
    }
    
    tipLabel1.snp.makeConstraints { (make) in
        
        make.centerY.equalTo(contentView)
        make.left.equalTo(logoImage1.snp.right).offset(10)
    }
    
     logoImage2.snp.makeConstraints { (make) in
        
        make.centerY.equalTo(contentView)
        make.left.equalTo(kScreenW/2+20)
        make.size.equalTo(logoImage1)
    }
    
    tipLabel2.snp.makeConstraints { (make) in
        
        make.centerY.equalTo(contentView)
        make.left.equalTo(logoImage2.snp.right).offset(10)
    }
    
 }
    
   required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
