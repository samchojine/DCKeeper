//
//  PJ_DoubleExtension.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/11.
//

import UIKit


extension Double {
    
    func millionStr() -> String {
        
        return String(format: "%.1f万", self/10000)
        
    }
}

