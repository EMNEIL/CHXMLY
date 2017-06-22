//
//  CHRandViewController.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/12.
//  Copyright © 2017年 CT. All rights reserved.
// 榜单类

import UIKit
import HandyJSON
import SwiftyJSON
import SnapKit
class CHRandViewController: CHBaseViewController {

    let headerFrame :CGRect = CGRect(x: 0, y: 0, width: kScreenW, height: 150)
    var headerModel :CHRecommandModel!
    var listModel   :CHRankModel!
    var detailModel :CHRankSubModel!
    lazy var headerView: CHRecommandHeaderView = {
        
        let view = CHRecommandHeaderView.init()
        view.frame = self.headerFrame
        return view
    }()
    
    lazy var myTableView: UITableView = {
        
        let tableview = UITableView.init(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH-150), style: .grouped)
        tableview.tableHeaderView = UIView(frame: self.headerFrame)
        tableview.tableHeaderView?.addSubview(self.headerView)
        tableview.register(CHRankCell.self, forCellReuseIdentifier: "cell3")
        tableview.delegate = self
        tableview.dataSource = self
        return tableview
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
      view.addSubview(self.myTableView)
        
       
      CHFindApi.requestRank { [unowned self] (result, error) in
        
        let json = JSON(result!)
        
        self.headerModel = JSONDeserializer<CHRecommandModel>.deserializeFrom(json: json["focusImages"].description)
        self.listModel = JSONDeserializer<CHRankModel>.deserializeFrom(json: json.description)!
       print(self.listModel.datas!)
        var array = [String]()
        
        if let list = self.headerModel.list{
            
            for item in list{
                
                array.append(item.pic ?? "")
            }
        }
        
        self.myTableView.reloadData()
        self.headerView.headerImage.imageURLStringsGroup = array
        
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

extension CHRandViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let tmpModel = self.listModel else { return 0}
        
        let model : CHDataModel = tmpModel.datas![section]
            
        return (model.list?.count)!
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell :CHRankCell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! CHRankCell
         guard let tmpModel = self.listModel else { return cell}
        
        let array:[CHRankSubModel] = tmpModel.datas![indexPath.section].list!
        cell.detailModel = array[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        let logo = UIImageView.init(image: UIImage.init(named:"findsection_logo"))
        view.addSubview(logo)
        
        let label = UILabel.init()
        view.addSubview(label)
        label.text = ["节目榜单","主播榜单"][section]
        
        
        logo.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(view)
            make.left.equalTo(10)
            make.size.equalTo(CGSize(width: 8, height: 10))
        }
        
        label.snp.makeConstraints { (make) in
            
            make.centerY.equalTo(view)
            make.left.equalTo(logo.snp.right).offset(5)
        }
        
        
        return view
    }
}
