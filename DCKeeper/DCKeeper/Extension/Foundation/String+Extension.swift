//
//  String+Extension.swift
//  TheOptimal
//
//  Created by Jxiongzz on 2020/2/17.
//  Copyright © 2020 ZhiYou. All rights reserved.
//

import UIKit
import CommonCrypto

// MARK: ***********   获取文字高度    **********
extension String{
    
    // MARK:- 计算文字的size
    func calculateHeightWithFontSize(fontSize:CGFloat,width:CGFloat) -> CGSize{
        let size = (self as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: fontSize)], context: nil)
        return size.size
    }
    
    // MARK:- 计算文字的宽度
    func calculateWidthWithFont(_ font:UIFont) -> CGFloat {
        let size = (self as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 50), options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font:font], context: nil)
        return size.width
    }
    
    // MARK:- 计算文字的高度
    func calculateHeightWithFontSize(_ fontSize:CGFloat,width:CGFloat) -> CGFloat {
        let size = (self as NSString).boundingRect(with: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude), options: [.usesLineFragmentOrigin], attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: fontSize)], context: nil)
        return size.height
    }
    
}

// MARK: ***********  md5 加密  **********

//MD5加密
//func md5Encrypt() -> String {
//    let utf8_str = self as NSString.cString(using: .utf8)
//    let str_len = CC_LONG(self.lengthOfBytes(using: .utf8))
//    let digest_len = Int(CC_MD5_DIGEST_LENGTH)
//    let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digest_len)
//    CC_MD5(utf8_str, str_len, result)
//    let str = NSMutableString()
//    for i in 0..<digest_len {
//        str.appendFormat("%02x", result[i])
//    }
//    result.deallocate()
//    return str as String
//}

// MARK: ***********  校验字符串    **********

extension String {
    
    /// 正则验证
    /// - Parameter fitter: 正则表达式
    func predicate(fitter:String) -> Bool{
        let pre = NSPredicate(format:"SELF MATCHES %@", fitter)
        return pre.evaluate(with: self)
    }
    
    // MARK:- 是否有效的电话号码 true 有效  false 无效
    func isValidPhone() ->Bool {
        let fitter = "^((13[0-9])|(15[^4,\\D]) |(17[0,0-9])|(18[0,0-9]))\\d{8}$"
        return predicate(fitter: fitter)
    }
    
    // MARK:- 是否有效的邮箱
    func isValidEmail() ->Bool {
        let fitter = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
        return predicate(fitter: fitter)
    }
    
    // MARK:- 是否有效的链接
    func isValidUrl() ->Bool {
        let fitter = "^(https?:\\/\\/)?([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?$"
        return predicate(fitter: fitter)
    }
    
    
    // MARK:- 是否是 数字字母组合
    func isContainNumAndLetter() ->Bool {
        do {
            let regular = try NSRegularExpression(pattern: "[A-Za-z]", options: .caseInsensitive)
            let count = regular.numberOfMatches(in: self, options: .reportProgress, range: NSRange(location: 0, length: self.count))
            
            let regular1 = try NSRegularExpression(pattern: "[0-9]", options: .caseInsensitive)
            let count1 = regular1.numberOfMatches(in: self, options: .reportProgress, range: NSRange(location: 0, length: self.count))
            if count > 0 && count1 > 0 {
               return true
            }
            return false
        } catch  {
            
        }
        return false
    }
    
    // MARK:- 是否有效的身份证号码
    func isValidIdcar() ->Bool {
        
         var value = self
               value = value.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
               var length : Int = 0
               length = value.count
               if length != 15 && length != 18{
                   //不满足15位和18位，即身份证错误
                   return false
               }
               // 省份代码
               let areasArray = ["11","12", "13","14", "15","21", "22","23", "31","32", "33","34", "35","36", "37","41", "42","43", "44","45", "46","50", "51","52", "53","54", "61","62", "63","64", "65","71", "81","82", "91"]
               // 检测省份身份行政区代码
               let valueStart2 = String(value.prefix(2))
               //标识省份代码是否正确
               var areaFlag = false
               for areaCode in areasArray {
                   if areaCode == valueStart2 {
                       areaFlag = true
                       break
                   }
               }
               if !areaFlag {
                   return false
               }
               var regularExpression : NSRegularExpression?
               var numberofMatch : Int?
               var year = 0
               switch length {
               case 15:
                   //获取年份对应的数字
                   let valueNSStr = value as NSString
                   let yearStr = valueNSStr.substring(with: NSRange.init(location: 6, length: 2)) as NSString
                   year = yearStr.integerValue + 1900
                   if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0) {
                       //创建正则表达式 NSRegularExpressionCaseInsensitive：不区分字母大小写的模式
                       //测试出生日期的合法性
                       regularExpression = try! NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$", options: NSRegularExpression.Options.caseInsensitive)
                   }else{
                       //测试出生日期的合法性
                       regularExpression = try! NSRegularExpression.init(pattern: "^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$", options: NSRegularExpression.Options.caseInsensitive)
                   }
                   numberofMatch = regularExpression?.numberOfMatches(in: value, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange.init(location: 0, length: value.count))
                   if numberofMatch! > 0 {
                       return true
                   }else{
                       return false
                   }
               case 18:
                   let valueNSStr = value as NSString
                   let yearStr = valueNSStr.substring(with: NSRange.init(location: 6, length: 4)) as NSString
                   year = yearStr.integerValue
                   if year % 4 == 0 || (year % 100 == 0 && year % 4 == 0) {
                       //测试出生日期的合法性
                       regularExpression = try! NSRegularExpression.init(pattern: "^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$", options: NSRegularExpression.Options.caseInsensitive)
                   }else{
                       //测试出生日期的合法性
                       regularExpression = try! NSRegularExpression.init(pattern: "^((1[1-5])|(2[1-3])|(3[1-7])|(4[1-6])|(5[0-4])|(6[1-5])|71|(8[12])|91)\\d{4}(((19|20)\\d{2}(0[13-9]|1[012])(0[1-9]|[12]\\d|30))|((19|20)\\d{2}(0[13578]|1[02])31)|((19|20)\\d{2}02(0[1-9]|1\\d|2[0-8]))|((19|20)([13579][26]|[2468][048]|0[048])0229))\\d{3}(\\d|X|x)?$", options: NSRegularExpression.Options.caseInsensitive)
                   }
                   numberofMatch = regularExpression?.numberOfMatches(in: value, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSRange.init(location: 0, length: value.count))
                   if numberofMatch! > 0 {
                       let a = getStringByRangeIntValue(Str: valueNSStr, location: 0, length: 1) * 7
                       let b = getStringByRangeIntValue(Str: valueNSStr, location: 10, length: 1) * 7
                       let c = getStringByRangeIntValue(Str: valueNSStr, location: 1, length: 1) * 9
                       let d = getStringByRangeIntValue(Str: valueNSStr, location: 11, length: 1) * 9
                       let e = getStringByRangeIntValue(Str: valueNSStr, location: 2, length: 1) * 10
                       let f = getStringByRangeIntValue(Str: valueNSStr, location: 12, length: 1) * 10
                       let g = getStringByRangeIntValue(Str: valueNSStr, location: 3, length: 1) * 5
                       let h = getStringByRangeIntValue(Str: valueNSStr, location: 13, length: 1) * 5
                       let i = getStringByRangeIntValue(Str: valueNSStr, location: 4, length: 1) * 8
                       let j = getStringByRangeIntValue(Str: valueNSStr, location: 14, length: 1) * 8
                       let k = getStringByRangeIntValue(Str: valueNSStr, location: 5, length: 1) * 4
                       let l = getStringByRangeIntValue(Str: valueNSStr, location: 15, length: 1) * 4
                       let m = getStringByRangeIntValue(Str: valueNSStr, location: 6, length: 1) * 2
                       let n = getStringByRangeIntValue(Str: valueNSStr, location: 16, length: 1) * 2
                       let o = getStringByRangeIntValue(Str: valueNSStr, location: 7, length: 1) * 1
                       let p = getStringByRangeIntValue(Str: valueNSStr, location: 8, length: 1) * 6
                       let q = getStringByRangeIntValue(Str: valueNSStr, location: 9, length: 1) * 3
                       let S = a + b + c + d + e + f + g + h + i + j + k + l + m + n + o + p + q
                       let Y = S % 11
                       var M = "F"
                       let JYM = "10X98765432"
                       M = (JYM as NSString).substring(with: NSRange.init(location: Y, length: 1))
                       let lastStr = valueNSStr.substring(with: NSRange.init(location: 17, length: 1))
                       if lastStr == "x" {
                           if M == "X" {
                               return true
                           }else{
                               return false
                           }
                       }else{
                           if M == lastStr {
                               return true
                           }else{
                               return false
                           }
                       }
                   }else{
                       return false
                   }
               default:
                   return false
               }
    }
    
    func getStringByRangeIntValue(Str : NSString,location : Int, length : Int) -> Int{
        let a = Str.substring(with: NSRange(location: location, length: length))
        let intValue = (a as NSString).integerValue
        return intValue
    }
    
}

extension String {
    
    /// MD5 加密
    ///
    /// - Returns: 32 位大写
    func MD5() -> String {
        let str = self.cString(using: .utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity:digestLen)
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02X", result[i])
        }
        return String(format: hash as String)
    }
}




