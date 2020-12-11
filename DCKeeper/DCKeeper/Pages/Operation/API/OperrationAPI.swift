//
//  OperrationAPI.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/11.
//

import UIKit

import Moya


let OperrationProvider = MoyaProvider<OperrationAPI>(plugins: [SSYNetworkLoggerPlugin(),SSYLoginDetectMoyaPlugin()])

enum OperrationAPI{
    
    /// 获取大区督导列表
    case getPerfanmanceList(parameters:[String:Any])
    
}

extension OperrationAPI : TargetType{
    
    var task: Task {
        switch self {
        case .getPerfanmanceList(let param):
            return .requestParameters(parameters: param, encoding:  URLEncoding.default) ///JSONEncoding


        }
    }
        
    var path: String {
        switch self {
        case .getPerfanmanceList:
            return "/app/index/performance/list"
        }
       

    }
    
    var method: Moya.Method {

        switch self {
        case .getPerfanmanceList:
            return .get
        default:
            return .post
        }
    }
}
