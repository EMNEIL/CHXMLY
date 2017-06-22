
//
//  CHCategoryViewController.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/12.
//  Copyright © 2017年 CT. All rights reserved.
// 分类控制器

import UIKit
import HandyJSON
import SwiftyJSON
class CHCategoryViewController: CHBaseViewController {
    
    var headerModel :CHRecommandModel!
    var listModel :CHRecommandModel!
    let headerFrame:CGRect = CGRect(x: 0, y: 0, width: kScreenW, height: 250)
    
    lazy var headerView: CHRecommandHeaderView = {
        let header = CHRecommandHeaderView.init()
        header.frame = self.headerFrame
        return header
    }()

    lazy var myTableView: UITableView = {
        let tableView = UITableView(frame:CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH-65-85), style: .plain)
      
        tableView.tableHeaderView = UIView(frame: self.headerFrame)
        tableView.tableHeaderView?.addSubview(self.headerView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.gray
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

         view.addSubview(self.myTableView)
         myTableView.register(CHCategoryCell.self, forCellReuseIdentifier: "cell2")
         CHFindApi.requestBanner { [unowned self] (result, error) in
            
            let json  = JSON(result!)
            
            self.headerModel = JSONDeserializer<CHRecommandModel>.deserializeFrom(json: json["focusImages"].description)
            
            var array = [String]();
            
            if let list = self.headerModel.list{
                
                for item in list{
                    
                    array.append(item.pic ?? "")
                }
            }
            
            
            self.headerView.headerImage.imageURLStringsGroup = array
        }
        
        CHFindApi.requestCate { [unowned self] (result, error) in
            
            let json = JSON(result!)
            self.headerModel = JSONDeserializer<CHRecommandModel>.deserializeFrom(json: json["discoveryColumns"].description)
            self.listModel = JSONDeserializer<CHRecommandModel>.deserializeFrom(json: json.description)!
            self.headerView.recommandCategoryView.modelArray = self.headerModel.list!
            self.myTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CHCategoryViewController:UITableViewDataSource,UITableViewDelegate{
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:CHCategoryCell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CHCategoryCell
        var modelArray  = [CHRecommandHeaderModel]();
        if let tmpModel = self.listModel {
            modelArray.removeAll()
            var tmpArray = tmpModel.list!
            tmpArray.removeFirst()
           let i = 6*indexPath.section+2*indexPath.row  //所需要的数组下标
            
            modelArray.append(tmpArray[i])
            modelArray.append(tmpArray[i+1])
            
            cell.modelAarray = modelArray
            
            
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section==4 {
            return 10
        }
        else{
        
            
            return 0.00001
        }
    }
}
