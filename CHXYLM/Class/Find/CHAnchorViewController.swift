//
//  CHAnchorViewController.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/12.
//  Copyright © 2017年 CT. All rights reserved.
// 主播类

import UIKit
import HandyJSON
import SwiftyJSON
import SnapKit
class CHAnchorViewController: CHBaseViewController {
    
    var anchorModelArray:[CHAnchorSubModel]!
    lazy var myTableView: UITableView = {
        let tabFrame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH-150)
        let tableView = UITableView.init(frame: tabFrame, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        tableView .register(CHAnchorCell.self, forCellReuseIdentifier: "cell4")
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(self.myTableView)
        
        CHFindApi.requestAnchor {[unowned self] (result, error) in
            
             let json = JSON(result!)
            let arr1 = JSONDeserializer<CHAnchorSubModel>.deserializeModelArrayFrom(json: json["famous"].description) as! [CHAnchorSubModel]
            let arr2 = JSONDeserializer<CHAnchorSubModel>.deserializeModelArrayFrom(json: json["normal"].description) as! [CHAnchorSubModel]
            
            self.anchorModelArray = arr1 + arr2
            
            self.myTableView.reloadData()
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CHAnchorViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let array = self.anchorModelArray else { return 0  }
        return array.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let array = self.anchorModelArray else { return 0  }
        return array[section].list!.count / 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:CHAnchorCell = tableView.dequeueReusableCell(withIdentifier: "cell4", for:indexPath ) as! CHAnchorCell
        if let modelArray = self.anchorModelArray {
            
          let arr = Array(modelArray[indexPath.section].list![indexPath.row*3...indexPath.row*3+2])
        cell.modelArray = arr
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView.init()
        view.backgroundColor = UIColor.white
        
        let label = UILabel.init()
        view.addSubview(label)
//        if let modelArray = self.anchorModelArray {
//            
//             label.text = modelArray[section].title!
//        }
        
        label.text = self.anchorModelArray[section].title ?? ""   // 当数组是nil时  设置默认的值
        label.snp.makeConstraints { (make) in
            make.centerY.equalTo(view)
            make.left.equalTo(20)
        }
        return view
    }
}
