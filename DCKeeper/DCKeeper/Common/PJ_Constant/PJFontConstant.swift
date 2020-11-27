//
//  File.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/5/9.
//  Copyright © 2020 champ. All rights reserved.
//  字体配置

import Foundation

// 标题
let PTitleFont = k_MediumFont(size:16)

// 详情
let PDetailFont = k_RegularFont(size:14)

// 输入框占位符
let PPlaceHolderFont = k_RegularFont(size:12)

///  常规
func k_RegularFont(size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .regular)
}

///  中
func k_MediumFont(size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .medium)
}

///  粗体
func k_BoldFont(size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size, weight: .bold)
}
