//
//  CHRecommandCategoryView.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/13.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit

class CHRecommandCategoryView: UICollectionView {
    
    var modelArr:[CHRecommandHeaderModel]?
    var modelArray :[CHRecommandHeaderModel]?{
        
        get{
          return [CHRecommandHeaderModel]()
        }
        set(newModelArray){
            modelArr = newModelArray
            self.reloadData()
        }
        
    }
    
    init() {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        super.init(frame: CGRect(), collectionViewLayout: layout)
        layout.itemSize = CGSize(width: 71, height: 90)
        layout.scrollDirection = .horizontal
        self.dataSource=self;
        self.backgroundColor = UIColor.white
        self.showsHorizontalScrollIndicator = false
        self.register(CHRecommandCategoryCell.self, forCellWithReuseIdentifier: "cell1")
        
    }
   
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension CHRecommandCategoryView:UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let arr = modelArr {
          return  arr.count
        }
        return 0;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! CHRecommandCategoryCell
        if let arr = modelArr {

        cell.model = arr[indexPath.row]
        }
        return cell
    }
}


