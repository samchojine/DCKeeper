//
//  PJSizeConstant.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/5/8.
//  Copyright © 2020 champ. All rights reserved.
//  尺寸配置

import Foundation

///Screen
let kScreenBounds = UIScreen.main.bounds
let kScreenWidth = UIScreen.main.bounds.size.width
let kScreenHeight = UIScreen.main.bounds.size.height

///比例 已6s的4.7尺寸的屏幕为基准
let kWidthRatio = kScreenWidth / 375.0
let kHeightRatio = kScreenHeight / 667.0

///导航栏高度
let kNaviHeight : CGFloat = 44

///状态栏高度
let kStatusHeight = UIApplication.shared.statusBarFrame.height

/// 头部高度
let kTopHeight = (kNaviHeight + kStatusHeight)

/// tabebar高度
let kTabebarHeight = 49 + kBottomSafeInset

/// 底部安全距离
var kBottomSafeInset :CGFloat {
    
    var bottomH: CGFloat = 0.0
    if #available(iOS 11.0, *) {
        bottomH = CGFloat((UIApplication.shared.delegate?.window?!.safeAreaInsets.bottom)!)
    }
    return bottomH
}


///  修复约束，适配尺寸
func PFixWidth(value:CGFloat) -> CGFloat {
    
    return value*kWidthRatio

}
