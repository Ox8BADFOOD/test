//
//  ZZDisposeBag.swift
//
//  Created by Max on 2019/2/25.
//  Copyright © 2019 BaiYiYuan. All rights reserved.
//

import Foundation
import RxSwift

public protocol ZZHasDisposeBag {
    var zz_disposeBag: DisposeBag { get set }
    
    static var zz_disposeBag: DisposeBag { get set }
}

private var hasDisposeBagKey = "ZZDisposeBag"

public extension ZZHasDisposeBag {
    var zz_disposeBag: DisposeBag {
        get {
            if let disposeBag = objc_getAssociatedObject(self, &hasDisposeBagKey) as? DisposeBag {
                return disposeBag
            }
            
            let disposeBag = DisposeBag()
            objc_setAssociatedObject(self, &hasDisposeBagKey, disposeBag, .OBJC_ASSOCIATION_RETAIN)
            return disposeBag
        }
        set {
            objc_setAssociatedObject(self, &hasDisposeBagKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    static var zz_disposeBag: DisposeBag {
        get {
            if let disposeBag = objc_getAssociatedObject(self, &hasDisposeBagKey) as? DisposeBag {
                return disposeBag
            }
            
            let disposeBag = DisposeBag()
            objc_setAssociatedObject(self, &hasDisposeBagKey, disposeBag, .OBJC_ASSOCIATION_RETAIN)
            return disposeBag
        }
        set {
            objc_setAssociatedObject(self, &hasDisposeBagKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

extension NSObject: ZZHasDisposeBag {

}
