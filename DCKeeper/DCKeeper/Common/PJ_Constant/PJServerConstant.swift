//
//  PJServerConstant.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/6/10.
//  Copyright © 2020 champ. All rights reserved.
//  设置服务器域名

/*
 
 在target下 Build Settings 搜索 Other Swift Flags
 设置Debug 添加 -D DEBUG,注意不要好Release一起添加
 */

import UIKit


// 获取域名字符串
let  PBaseUrlStr =  PJ_BaseUrl()

// 获取域名 Url
let  PBaseUrl =  URL(string: PBaseUrlStr)!


func PJ_BaseUrl() ->String {
    
    #if DEBUG // debug 模式下

    let url = "http://120.79.203.119:12200"
    return url;
    
    #else // release 模式下
    
    let url = "https://purchase-service.lingmahui-vip.com"
    return url;
    
    #endif
    
}
