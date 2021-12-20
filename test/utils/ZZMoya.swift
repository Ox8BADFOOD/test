//
//  ZZMoya.swift
//  test
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation

// MARK: - Helpers
public extension String {
    var urlEscaped: String {
        addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        Data(self.utf8)
    }
}
