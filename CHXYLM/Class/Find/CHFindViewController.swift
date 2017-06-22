//
//  CHFindViewController.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/12.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit

class CHFindViewController: CHBaseViewController {

    lazy var categorTitleArray :[String] = {
       
        return ["推荐", "分类", "广播", "榜单", "主播"]
    }()
    //懒加载本质是block实现
    lazy var subControllers:[CHBaseViewController] = {
         // [unowned self]  ==> weakSelf 解决循环引用问题
        [unowned self] in
        
        // 创建一个数组
        var subVC:[CHBaseViewController] = [CHBaseViewController]()
        
    
        for title in self.categorTitleArray{
            let vc = LXFSubFindFactory.subFindVcWith(identifier: title)
            subVC.append(vc)
        }
        return subVC
    }()
    
    // 子标题视图
    lazy var subPageView:LXFFindSubTitleView = {
        [unowned self] in
        
        let subPageView  = LXFFindSubTitleView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 40))
        subPageView.delegate = self;
        return subPageView;
    }()
    
    //子控制器
    lazy var pageVC: LXFPageViewController = {
        
         let pageVC = LXFPageViewController(superController: self, controllers: self.subControllers)
         pageVC.delegate = self
        return pageVC
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(subPageView)
        self.view.addSubview(pageVC.view)
        subPageView.titleArray = categorTitleArray
        
        pageVC.view.snp.makeConstraints { (make) in
            
            make.top.equalTo(subPageView.snp.bottom)
            make.left.right.equalTo(view)
            make.bottom.equalTo(view.snp.bottom).offset(-49)
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension CHFindViewController:LXFFindSubTitleViewDelegate{
  
    
    func findSubTitleViewDidSelected(_ titleView: LXFFindSubTitleView, atIndex: NSInteger, title: String) {
        // 跳转对相应的子标题界面
        pageVC.setCurrentSubControllerWith(index: atIndex)
    }
}

extension CHFindViewController:LXFPageViewControllerDelegate{
    
    func lxfPageCurrentSubControllerIndex( index: NSInteger, pageViewController: LXFPageViewController){
        
        subPageView.jump2Show(at: index)
    }
}
