//
//  CHRankCell.swift
//  CHXYLM
//
//  Created by Laurence on 2017/6/21.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import SnapKit
class CHRankCell: UITableViewCell {
    var detailModel : CHRankSubModel{
       
        get{
           
            return CHRankSubModel()
        }
        
        set(newModel){
           
           logoImage.sd_setImage(with: URL.init(string: newModel.coverPath!))
           title.text = newModel.title!
            
            if (newModel.firstKResults?.count)! < 2 {
                subTitle.text = "1 " + (newModel.firstKResults?[0].title)!
            }
            else{
           subTitle.text = "1 " + (newModel.firstKResults?[0].title)! + "\n" + "2 " + (newModel.firstKResults?[1].title)!
            }
        }
    }
    lazy var logoImage: UIImageView = {
        
        let imageView  = UIImageView.init()
        return imageView
    }()
    
    lazy var title: UILabel = {
        
         let label = UILabel.init()
         label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var subTitle: UILabel = {
        
        let label = UILabel.init()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12)
        
        let paraph = NSMutableParagraphStyle()
        paraph.lineSpacing = 10
        
        let attr = [NSFontAttributeName:UIFont.systemFont(ofSize: 12),NSParagraphStyleAttributeName:paraph]
        
        label.attributedText = NSAttributedString(string: "", attributes: attr)
        return label
    }()
    
    lazy var playButton: UIButton = {
        
        let button = UIButton.init()
        button.setImage(UIImage.init(named:"liveRadioCellPlay"), for: .normal)
        return button
    }()
   
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(self.logoImage)
        contentView.addSubview(self.title)
        contentView.addSubview(self.subTitle)
        contentView.addSubview(self.playButton)
        
       logoImage.snp.makeConstraints { (make) in
        
           make.centerY.equalTo(contentView)
           make.left.equalTo(10)
           make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        
        title.snp.makeConstraints { (make) in
            
            make.top.equalTo(self.logoImage)
            make.left.equalTo(logoImage.snp.right).offset(10)
            make.height.equalTo(17)
        }
        
        subTitle.snp.makeConstraints { (make) in
            
            make.left.equalTo(title)
            make.top.equalTo(title.snp.bottom).offset(3)
            make.right.equalTo(playButton.snp.left).offset(-10)
            make.bottom.equalTo(logoImage)
        }
        
        playButton.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(contentView)
            make.right.equalTo(-20)
            make.size.equalTo(CGSize(width: 32, height: 32))
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
