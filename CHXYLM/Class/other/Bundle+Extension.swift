//
//  Bundle+Extension.swift
//  CHXYLM
//
//  Created by 陈辉 on 2017/1/12.
//  Copyright © 2017年 CT. All rights reserved.
//

import Foundation
extension Bundle{
   
    var namespace:String{
      
        return infoDictionary?["CFBundleName"] as? String ?? ""
    }
}
