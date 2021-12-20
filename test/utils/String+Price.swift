//
//  String+Price.swift
//  test
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation

extension String{
    
    /// 转成带两位小数点的字符串
    func to2PointFloat() ->String{
        if let val = Float(self){
            let scaleVal = val * 100
            let pureVal = floor(scaleVal)
            return String(format: "%.2f", pureVal/100.0)
        }else{
            fatalError("搞错了兄弟")
        }
    }
    
    /// 每隔几位添加一个逗号
    /// - Parameters:
    ///   - comma: 添加的符号
    ///   - perLength: 步进的长度
    func insertComma(comma: String, perStep:Int = 3) -> String{
        var temp = ""
        var newStr = ""
        let strs = self.split(separator: ".")
        if strs.count  > 1{
            for (idx,c) in strs[0].reversed().enumerated() {
                temp = temp + String(c)
                if (idx+1) % 3 == 0{
                    temp = temp + ","
                }
            }
            
            for (_,c) in temp.reversed().enumerated() {
                newStr = newStr + String(c)
            }
            newStr = newStr + "."
            newStr = newStr + strs.last!
            if newStr.hasPrefix(","){
                let index = newStr.firstIndex(of: ",")!
                newStr = String(newStr[newStr.index(after:index)..<newStr.endIndex])
            }
            return newStr
        }
        
        return self
    }
    
    func moneyOfficialSpell() -> String{
        var newStr = self
        if newStr.hasPrefix("0"){
            let index = newStr.firstIndex(of: "0")!
            newStr = String(newStr[newStr.index(after:index)..<newStr.endIndex])
        }
        if newStr.hasPrefix("."){
            newStr = "0" + newStr
        }
        let str = to2PointFloat()
        return str.insertComma(comma: ",")
    }
}
