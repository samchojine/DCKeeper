//
//  OperationNormalModel.swift
//  DCKeeper
//
//  Created by fwn on 2020/12/11.
//

import UIKit

class OperationNormalModel: BaseModel {
    
    var lastTotalSalesAmount = 0.0
    var totalSaleTarget = 0.0
    var totalAchievementRate = 0.0
    var operationDtos:[OperationNormalListModel] = []
    var total = 0
    var current = 0
}


class OperationNormalListModel: BaseModel {
    
    var salesAmountTb = 0.0
    var warehouseCode = 0.0
    var salesAmount = 0.0
    var salesAmountHb = 0.0
    var lastSalesAmount = 0.0
    var saleTarget = 0.0
    var achievementRate = 0.0
    var sameSalesAmount = 0.0
    var name = ""
    var regionCode = 0.0
    
}
