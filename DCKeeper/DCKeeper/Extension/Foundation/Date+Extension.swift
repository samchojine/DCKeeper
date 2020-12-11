//
//  Date+Extension.swift
//  TheOptimal
//
//  Created by Jxiongzz on 2020/4/3.
//  Copyright © 2020 ZhiYou. All rights reserved.
//

import Foundation


// MARK:- 一、Date 基本的扩展
public extension Date {
    // MARK: 1.1、获取当前 秒级 时间戳 - 10 位
    /// 获取当前 秒级 时间戳 - 10 位
    static var secondStamp : String {
        let timeInterval: TimeInterval = Self().timeIntervalSince1970
        return "\(Int(timeInterval))"
    }

    // MARK: 1.2、获取当前 毫秒级 时间戳 - 13 位
    /// 获取当前 毫秒级 时间戳 - 13 位
    static var milliStamp : String {
        let timeInterval: TimeInterval = Self().timeIntervalSince1970
        let millisecond = CLongLong(round(timeInterval*1000))
        return "\(millisecond)"
   }

    // MARK: 获取当前的时间 Date
    static var currentDate : Date {
        return Self()
    }

    // MARK: 、从 Date 获取年份
    var year: Int {
        return Calendar.current.component(Calendar.Component.year, from: self)
    }

    // MARK: 从 Date 获取月份
    var month: Int {
        return Calendar.current.component(Calendar.Component.month, from: self)
    }
    
    // MARK: 从 Date 获取周
    var week: Int {
        return Calendar.current.component(Calendar.Component.weekday, from: self)
    }

    // MARK: 从 Date 获取 日
    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    // MARK:从 Date 获取 小时
    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    // MARK: 从 Date 获取 分钟

    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    // MARK:从 Date 获取 秒
    var second: Int {
        return Calendar.current.component(.second, from: self)
    }

    // MARK: 从 Date 获取 毫秒
    var nanosecond: Int {
        return Calendar.current.component(.nanosecond, from: self)
    }
    
    // MARK: 这个月的总天数
    var totalDaysInCurrentMonth:Int {

    let calendar = Calendar(identifier:Calendar.Identifier.gregorian)

    let range = (calendar as NSCalendar?)?.range(of: NSCalendar.Unit.day, in: NSCalendar.Unit.month, for: Date())

    return (range?.length)!

    }




}
