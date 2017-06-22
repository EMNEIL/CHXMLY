//
//  CHMainTabBarViewController.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/12.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit

class CHMainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置子控制器
        setUpControllers()
         //添加播放按钮
        setUpPlayButton()
       
        
    }
    private func setUpPlayButton(){
        tabBar.barTintColor = UIColor.white
        let playButton = UIButton.init()
        tabBar.addSubview(playButton)
        playButton.setImage(UIImage.init(named: "tabbar_np_playnon"), for: .normal)
        playButton.frame = CGRect(x: 100, y: -5, width: 50, height: 50)
        playButton.center.x = tabBar.center.x
        playButton.addTarget(self, action: #selector(play), for: .touchUpInside)
    }
    
    //MARK:播放实现
    @objc func play(){
       
        print("aaaa")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
extension CHMainTabBarViewController{
  
    func setUpControllers(){
    
    //获取沙盒json路径
    let jsonStr = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    let jsonPath = (jsonStr as NSString).appendingPathComponent("main.json")
    
    // 加载数据
    
    var data = NSData(contentsOfFile: jsonPath)
    
    if data==nil { //沙盒没有内容,需要从本地bundle获取
        
        let path = Bundle.main.path(forResource: "main.json", ofType: nil) //路径一定会有内容 实现强转
        data = NSData(contentsOfFile: path!)
        
    }
    
    //对data进行反序列化
    
    //对数组进行守护
    guard let messageArray = try?JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String:AnyObject]] else {
        return
    }
    
    var vcArray = [UIViewController]()
    for dic in messageArray! {
        
        vcArray.append(addChildsVC(dict: dic))
        
    }
    
    viewControllers = vcArray
        
  }
    
    private func addChildsVC(dict:[String:AnyObject]) -> UIViewController{
      
        guard  let className = dict["clsName"] as? String,
               let title = dict["title"] as? String,
               let imageName = dict["imageName"] as? String,
               let vcClass = NSClassFromString(Bundle.main.namespace + "." + className) as? CHBaseViewController.Type
        else {
            
            return UIViewController()
        }
   
        let vc = vcClass.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_h")?.withRenderingMode(.alwaysOriginal)
        //vc.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, 0, 0)
        vc.tabBarItem.title = ""
        let nav = CHBaseNavigationController(rootViewController: vc)
        return nav
    }
}
