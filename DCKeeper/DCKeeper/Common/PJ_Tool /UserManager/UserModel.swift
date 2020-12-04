//
//  UserModel.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/6/9.
//  Copyright © 2020 champ. All rights reserved.
//

import UIKit
import HandyJSON

class UserModel:Codable,HandyJSON{


    var userId:String  = ""
    var post = 0
    var userName:String = ""
    var token_type:String = ""
    var storeCode:String = ""
    var refresh_token:String = ""
    var storeName:String = ""
    var storeId:String = ""
    var access_token:String = ""
    var changePwFlag = 0
    var regionCode:String = ""
    
    required init() {}
    
    func mapping(mapper: HelpingMapper) {
        
    }

}
