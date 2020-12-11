//
//  MeAPI.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/2.
//

import Foundation

import UIKit
import Moya


let MeProvider = MoyaProvider<MeAPI>(plugins: [SSYNetworkLoggerPlugin(),SSYLoginDetectMoyaPlugin()])

enum MeAPI{
    
    /// 获取个人信息
    case getUserInfo(parameters:[String:Any])
    
    /// 获取业绩金额
    case getPerformance(parameters:[String:Any])
    
    /// 修改昵称
    case modifyNikeName(parameters:[String:Any])
    
    /// 获取店铺列表
    case getStoreList(parameters:[String:Any])
    
    /// 切换店铺
    case changeDefaultStore(parameters:[String:Any])
    
    /// 获取个人配置
    case getProjectConfig


}

extension MeAPI : TargetType{
    
    var task: Task {
        switch self {
        case .getUserInfo:
            return .requestParameters(parameters: [:], encoding:  URLEncoding.default) ///JSONEncoding

        case .getPerformance(parameters: let parameters ):
            return .requestParameters(parameters: parameters, encoding:  URLEncoding.default) ///JSONEncoding
        
        case .modifyNikeName(parameters: let parameters):
            return .requestParameters(parameters: parameters, encoding:  URLEncoding.default) ///JSONEncoding
        
        case .getStoreList(parameters: let parameters):
            return .requestParameters(parameters: parameters, encoding:  URLEncoding.default) ///JSONEncoding
        
        case .changeDefaultStore(parameters: let parameters):
            return .requestParameters(parameters: parameters, encoding:  URLEncoding.default) ///JSONEncoding
        
        case .getProjectConfig:
            return .requestParameters(parameters: [:], encoding:  URLEncoding.default) ///JSONEncoding
        }
    }
        
    var path: String {
        switch self {
        case .getUserInfo(let parameters):
            let userId =  parameters["id"] as! String
            return "/app/sys/user/info/" + userId

        case .getPerformance:
            return "/app/personal/list"
          
        case .modifyNikeName:
            return "/app/setting/list"
            
        case .getStoreList:
            return "/app/setting/info"
            
        case .changeDefaultStore:
            return "/app/setting/updateShop"
        case .getProjectConfig:
            return "/app/global/getSystemParam"
        }
       

    }
    
    var method: Moya.Method {

        switch self {
        case .changeDefaultStore:
            return .put
        default:
            return .get
        }
    }
}
