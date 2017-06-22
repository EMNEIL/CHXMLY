//
//  CHRecommandHeaderView.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/13.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import SDCycleScrollView
class CHRecommandHeaderView: UIView {
  
    lazy var headerImage: SDCycleScrollView = {
        
         let scrll = SDCycleScrollView(frame: CGRect.init(x: 0, y: 0, width: kScreenW, height: 150), delegate: self, placeholderImage: nil)
        
        return scrll!
    }()
    lazy var recommandCategoryView: CHRecommandCategoryView = {
        let view = CHRecommandCategoryView.init()
        return view
    }()
    init() {
        super.init(frame:CGRect())
        self.addSubview(headerImage)
        self.addSubview(recommandCategoryView)
        
        recommandCategoryView.snp.makeConstraints { (make) in
            make.left.right.bottom.equalTo(self)
            make.top.equalTo(headerImage.snp.bottom)
        
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CHRecommandHeaderView:SDCycleScrollViewDelegate{

   func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int){
    
    
    }
}
