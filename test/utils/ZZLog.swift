//
//  ZZLog.swift
//  test
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation

// MARK:- 自定义打印方法
func ZZLog<T>(_ message : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        // 创建一个日期格式器
        let formatter = DateFormatter()
        // 为日期格式器设置格式字符串
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        // 使用日期格式器格式化当前日期、时间
        let datestr = formatter.string(from: Date())
        
        let fileName = (file as NSString).lastPathComponent
        
        print("[\(datestr)] - [\(fileName)] [第\(lineNum)行] \(message)")
        
    #endif
}
