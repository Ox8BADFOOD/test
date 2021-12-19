//
//  ZZMutable.swift
//  ShareBeauty
//
//  Created by Max on on 2019/1/18.
//  Copyright © 2019 BaiYiYuan. All rights reserved.
//

import Foundation

protocol Mutable {
}

extension Mutable {
    @discardableResult
    func mutate(transform: (inout Self) -> Void) -> Self {
        var newSelf = self
        transform(&newSelf)
        return newSelf
    }
}

extension NSObject: Mutable {
}

extension Array: Mutable {
}

extension Dictionary: Mutable {
}
