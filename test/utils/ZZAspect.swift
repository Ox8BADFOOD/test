//
//  ZZAspect.swift
//  ShareBeauty
//
//  Created by Max on 2019/12/16.
//

import Foundation
import Aspects

/*
    把闭包转成AnyObject (应为Aspects接受的是id类型)
*
*    - parameter y_block:传入的闭包
*/
func aspectsBlockWrapper<T>(y_block:@escaping (T)->()) -> AnyObject{
    let wrappedBlock:@convention(block) (AspectInfo)-> Void = { aspectInfo in
        if let unPack = aspectInfo.instance() as? T {
            y_block(unPack)
        }
    }
    
    let wrappedObject: AnyObject = unsafeBitCast(wrappedBlock, to: AnyObject.self)
    return wrappedObject;
}
