//
//  CHFindApi.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/16.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
// 推荐
fileprivate let kRecommendBannerAPI = "http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21"
fileprivate let KRecommandDiscovery = "http://mobile.ximalaya.com/mobile/discovery/v2/recommend/hotAndGuess?code=43_110000_1100&device=iPhone&version=5.4.21"

//分类

fileprivate let kFindCate = "http://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=ios-b1&code=43_110000_1100&device=iPhone&picVersion=13&scale=2&version=5.4.27"

//榜单

fileprivate let kFindRank = "http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.27"

// 主播

fileprivate let kFindAnchor = "http://mobile.ximalaya.com/mobile/discovery/v1/anchor/recommend?device=iPhone&version=5.4.27"
class CHFindApi: NSObject {

    class func requestBanner(_ completed:@escaping (_ result:[String:AnyObject]?,_ error:NSError?) -> ()) {
    
        
        CHNetWorkTools.sharedInstance.requestData(urlString: kRecommendBannerAPI, methodType: .GET, parameters: nil) { (result, error) in
            
            let resultDict = result as? [String:AnyObject]
            completed(resultDict,error)
        }
       
    }
    
    
    class func requestDiscovery(_ completed:@escaping(_ result:[String:AnyObject]?,_ error:NSError?)->()){
       
           CHNetWorkTools.sharedInstance.requestData(urlString: KRecommandDiscovery, methodType: .GET, parameters: nil) { (result, error) in
            
            let resultDict = result as? [String:AnyObject]
            completed(resultDict ,error)
        }
    }
    
    class func requestCate(_ completed:@escaping(_ result:[String:AnyObject]?,_ error:NSError?)->()){
        
          CHNetWorkTools.sharedInstance.requestData(urlString: kFindCate, methodType: .GET, parameters: nil) { (result, error) in
            
            let resultDict = result as? [String:AnyObject]
            completed(resultDict,error)
        }
        
    }
    
    class func requestRank(_ completed:@escaping(_ result:[String:AnyObject]?,_ error :NSError?)->()){
    
        
          CHNetWorkTools.sharedInstance.requestData(urlString: kFindRank, methodType: .GET, parameters: nil) { (result, error) in
            let resultDict = result as? [String:AnyObject]
            completed(resultDict,error)
        }
    }
    
    class func requestAnchor(_ completed : @escaping (_ result : [String:AnyObject]?,_ error : NSError?) -> ()){
        
        CHNetWorkTools.sharedInstance.requestData(urlString: kFindAnchor, methodType: .GET, parameters: nil) { (result, error) in
            let resultDict = result as? [String:AnyObject]
            completed(resultDict,error)
    }
  }
}

