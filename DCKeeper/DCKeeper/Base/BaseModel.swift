//
//  BaseModel.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/4.
//

import UIKit
import HandyJSON

// 基于class
class BaseModel: HandyJSON {

    
    required init() {}
    
    func mapping(mapper: HelpingMapper) {
        
    }
}

// 基于 struct
struct BaseStructModel:HandyJSON {

}

// 分页model
class ZYPageModel<Record:HandyJSON>: HandyJSON {
    /// 总页数
    var pages = 0
    /// 总记录数
    var total = 0
    var current = 0
    var records : [Record] = []
    required init() {}
    
    var currentPage : Int {
        return current
    }
    
    var isFirstPage : Bool{
        return current == 1
    }
    
    var isLastPage : Bool {
        return pages == 0 || current == pages
    }
}



