//
//  CHRankModel.swift
//  CHXYLM
//
//  Created by Laurence on 2017/6/21.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import HandyJSON

class CHDataModel: HandyJSON {
    
    var title:String?
    var list : [CHRankSubModel]?
    
    
    required init() {
        
    }
}
class CHRankModel: HandyJSON {
   

    var datas:[CHDataModel]?
    
    required init() {
        
    }

}

class CHRankSubModel: HandyJSON {
    
    var title: String?
    var firstKResults : [CHRankfirstKResultsModel]?
    var coverPath : String?
    
    required init() {
        
    }
    
}

class CHRankfirstKResultsModel: HandyJSON {
    
    var title: String?

    
    required init() {
        
    }
    
}
