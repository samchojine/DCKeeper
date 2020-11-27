//
//  PJ_ButtonExtension.swift
//  SwiftDemoProject
//
//  Created by champ on 2020/5/7.
//  Copyright © 2020 champ. All rights reserved.
//

import UIKit

extension UIButton {
    
    func createTitleAndImageBtn(title:String? = "",
                                font:CGFloat = 14,
                                fontWeight:UIFont.Weight = .regular,
                                titleColor:UIColor = .darkText,
                                imageName:String = "") -> UIButton {
        
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: font, weight: fontWeight)
        return btn
    }
    
}
