//
//  CHRecommandCategoryCell.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/13.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import SDWebImage
let imageH:CGFloat = 43
class CHRecommandCategoryCell: UICollectionViewCell {
  
    var model:CHRecommandHeaderModel{
        get{
          
            return CHRecommandHeaderModel();
        }
        set(newModel){
           
            self.tipLabel.text = newModel.title;
            let url = URL(string: newModel.coverPath!)
            self.pic.sd_setImage(with:url)
        }
    }
    lazy var pic: UIImageView = {
        let view:UIImageView = UIImageView.init()
        view.layer.cornerRadius = imageH/2
        view.layer.masksToBounds = true
        return view
    }()
    
    lazy var tipLabel: UILabel = {
        
        let label = UILabel.init()
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    override init(frame:CGRect) {
        super.init(frame: CGRect())
        self.addSubview(pic)
        self.addSubview(tipLabel)
       
        pic.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.size.equalTo(CGSize(width: imageH, height: imageH))
            make.top.equalTo(self).offset(16)
        }
        
        tipLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.top.equalTo(pic.snp.bottom).offset(10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
