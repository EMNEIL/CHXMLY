//
//  CHAnchorModel.swift
//  CHXYLM
//
//  Created by Laurence on 2017/6/23.
//  Copyright © 2017年 CT. All rights reserved.
//

import UIKit
import HandyJSON

class CHAnchorModel: HandyJSON {
    
    var famous : [CHAnchorSubModel]?
    var normal : [CHAnchorSubModel]?
    
    required init() {
        
    }
}

class CHAnchorSubModel: HandyJSON {
    
    var title : String?
    var list  : [CHAnchorListModel]?
    
    
    required init() {
        
    }
}


class CHAnchorListModel: HandyJSON {
    
    var nickname       :String?
    var middleLogo     :String?
    var personDescribe :String?
    
    required init() {
        
    }
}
