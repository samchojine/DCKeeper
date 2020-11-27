//
//  LoginAPI.swift
//  DCKeeper
//
//  Created by fwn on 2020/11/24.
//

import UIKit
import Moya


let LoginProvider = MoyaProvider<LoginAPI>(plugins: [SSYNetworkLoggerPlugin(),SSYLoginDetectMoyaPlugin()])

enum LoginAPI{
    
    /// 登录
    case login(parameters:[String:Any])
    /// 获取商品评论
    case addGoodsComment(parameters:[String:Any])

}

extension LoginAPI : TargetType{
    
    var task: Task {
        switch self {
        case .login(let parameters):
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default) ///JSONEncoding
        case .addGoodsComment(let parameters):
            return .requestParameters(parameters: parameters, encoding: JSONArrayEncoding.default)
//        default:
//            return .requestPlain
        }
    }
        
    var path: String {
        switch self {
        case .login:
            return "/app/sys/user/login"
        case .addGoodsComment:
            return "/api/goodsComment/save"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        default:
            return .get
        }
    }
}

