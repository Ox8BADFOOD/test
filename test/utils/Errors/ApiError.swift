//
//  ApiError.swift
//  test
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation

enum ApiError: Error {
    case connectivity, invalidData
    
    var message: String {
        switch self {
        case .connectivity:
            return "Failed to connect. Please check internet connection."
        case .invalidData:
            return "Some error occured. Please try again later."
        }
    }
}
