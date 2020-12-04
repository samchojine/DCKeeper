//
//  UserManager.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/6/9.
//  Copyright © 2020 champ. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    
    static let userSaveKey = "userSaveKey"
    static let shared = UserManager()
    
    // 存取 User 信息
    var user: UserModel?  {
        
        get{
            
            guard let model = UserDefaults.standard.getItem(UserModel.self, forKey: UserManager.userSaveKey) else {
                return nil
            }
            return model
        }
        set {
            UserDefaults.standard.setItem(newValue, forKey: UserManager.userSaveKey)
        }
    }
    
    // 存取token
    var token:String {

        get{
            return self.user?.access_token ?? ""
        }
        set {
            let model =  self.user
            model?.access_token = newValue
            self.user  = model
        }
    }
    
    var isLogin:Bool {
        
        get{
            return !self.token.isEmpty 
        }
    }
    
    func deleteUserInfo() {
        
        let user = UserModel()
        self.user = user
        
    }
    
    


}
