
//
//  CHRecommandViewController.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/12.
//  Copyright © 2017年 CT. All rights reserved.
// 推荐控制器

import UIKit
import SwiftyJSON
import HandyJSON
class CHRecommandViewController: CHBaseViewController {
   
    var headerModel : CHRecommandModel!
    var listModel:CHRecommandModel!
    let headerFrame:CGRect = CGRect(x: 0, y: 0, width: kScreenW, height: 250)
    //顶部懒加载
    lazy var recommandHeaderView: CHRecommandHeaderView = { [unowned self] in
       let header = CHRecommandHeaderView.init()
        header.frame = self.headerFrame
 
        return header
    }()
    //tableView懒加载
    lazy var myTableView: UITableView = {  [unowned self] in
        let frame :CGRect = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH-65-85)
        
        let tab = UITableView(frame: frame, style: .plain)
        tab.tableHeaderView = UIView(frame: self.headerFrame)
        tab.tableHeaderView?.addSubview(self.recommandHeaderView)
        tab.delegate = self
        tab.dataSource = self
        
        return tab
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myTableView)
        myTableView.register(CHFindCell.self, forCellReuseIdentifier: "cell")
        CHFindApi.requestBanner { [unowned self] (result, error) in
            
            let json  = JSON(result!)
            
            self.headerModel = JSONDeserializer<CHRecommandModel>.deserializeFrom(json: json["focusImages"].description)
            
            var array = [String]();
            
            if let list = self.headerModel.list{
               
                for item in list{
                  
                    array.append(item.pic ?? "")
                }
            }
            
            
            self.recommandHeaderView.headerImage.imageURLStringsGroup = array
        }
        CHFindApi.requestDiscovery {[unowned self] (result, error) in
            
             let json = JSON(result!)
             self.headerModel =  JSONDeserializer<CHRecommandModel>.deserializeFrom(json: json["discoveryColumns"].description)
            self.listModel = JSONDeserializer<CHRecommandModel>.deserializeFrom(json: json["cityColumn"].description)
             self.recommandHeaderView.recommandCategoryView.modelArray = self.headerModel.list!
            
           self.myTableView.reloadData()
        }
        
        
       
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

// MARK:- UITableViewDelegate & UITableViewDataSource

extension CHRecommandViewController:UITableViewDelegate,UITableViewDataSource{

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:CHFindCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CHFindCell
        if let model = listModel {
            cell.model = model
        }
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 229
    }
}
