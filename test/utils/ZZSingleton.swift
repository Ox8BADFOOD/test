//
//  ZZSingleton.swift
//  ShareBeauty
//
//  Created by Max on 2019/12/16.
//

import Foundation

/// 单例协议
public protocol ZZSingleton: AnyObject {
    static func zz_sharedInstance() -> Self
    static func zz_modifyInstance(_ obj: Self) -> Void
    static func zz_createSingleton() -> Any
}

private var singletonKey = ""

public extension ZZSingleton {
    
    /// 类对象的关联属性，类对象只会存在一份
    fileprivate static var share_instance: Self! {
        get {
            return objc_getAssociatedObject(self, &singletonKey) as? Self
        }
        set {
            objc_setAssociatedObject(self, &singletonKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
    
    
    /// 获取单例的方法
    /// - Returns: 单例对象
    static func zz_sharedInstance() -> Self {
        if share_instance == nil {
            share_instance = transitionOrFatalError(zz_createSingleton())
        }
        return share_instance
    }
    
    static func zz_modifyInstance(_ obj: Self) -> Void {
        share_instance = obj
    }
}

/// 解包不成功就报错
/// - Returns: 解包的值
public func transitionOrFatalError<T>(_ value: Any) -> T {
    if let castValue = value as? T {
        return castValue
    } else {
        fatalError("Can't cast \(value) to \(T.self)")
    }
}
