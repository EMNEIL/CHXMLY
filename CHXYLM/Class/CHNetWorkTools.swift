//
//  CHNetWorkTools.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/13.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import Alamofire
enum RequestType:Int {
    case GET
    case POST
}
class CHNetWorkTools: NSObject {
    
      //单例
    static let sharedInstance:CHNetWorkTools = {
        
        let tool = CHNetWorkTools()
        return tool
    }()
}

// MARK: - 封装请求方法
extension CHNetWorkTools{
    
    func requestData(urlString:String,methodType:RequestType,parameters:[String:AnyObject]?,compelted:@escaping (_ result:AnyObject?,_ error: NSError?)->()) {
        
        
        let resultCallBlock = { (response:DataResponse<Any>) in
            
            if response.result.isSuccess {
                compelted(response.result.value as AnyObject?,nil)
            }
            else{
              compelted(nil,response.result.error as NSError?)
                
            }
           
        }
        
        let httpMethod:HTTPMethod = methodType == .GET ? .get : .post
        request(urlString, method: httpMethod, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: resultCallBlock)
            
        }
        
    }
    

