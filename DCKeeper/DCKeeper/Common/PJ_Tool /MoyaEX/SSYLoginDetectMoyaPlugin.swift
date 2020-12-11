//
//  SSYLoginDetectMoyaPlugin.swift
//  TheOptimal
//
//  Created by Jxiongzz on 2020/3/9.
//  Copyright © 2020 ZhiYou. All rights reserved.
//

import UIKit
import Moya
import Result

class SSYLoginDetectMoyaPlugin: PluginType {
    
    func willSend(_ request: RequestType, target: TargetType) {
        
    }
    
    func didReceive(_ result: Result<Moya.Response, MoyaError>, target: TargetType) {
        switch result {
        case .failure(_):
            break
        case .success(let result):
            let data = result.data
            let dic = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? Dictionary<String, Any> ?? [:]
            if let code = Int(dic?["code"] as? String ?? "0") {
                
                switch code {
                case RespNoLoginCheckCode,-110:
                    setNeedLogin()
                default:
                    break
                }
            }
        }
    }
    
    func setNeedLogin(){
        UserManager.shared.deleteUserInfo()
        let loginVC = LoginController()
        loginVC.modalPresentationStyle = .fullScreen
        UIApplication.shared.keyWindow?.rootViewController?.present(loginVC, animated: true, completion: nil)
    }
}

