//
//  ApiError.swift
//  test
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation

/// api 错误类型
enum ApiError: Error {
    /// 网络连接错误
    case connectivity
    /// 数据不合法
    case invalidData
    /// 服务器内部错误
    case serverInnerError(String?)
    
    var message: String {
        switch self {
            case .connectivity:
                return "Failed to connect. Please check internet connection."
            case .invalidData:
                return "Some error occured. Please try again later."
            case .serverInnerError(let notice):
                return notice ?? "Some error occured. Please try again later."
        }
    }
}
