//
//  PrimitiveSequence+ConnectivityError.swift
//  test
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation
import RxSwift
import Moya

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
    func catchConnectivityError() -> Single<Element> {
        return flatMap { response in
            // 状态码整数值是否在200到300之间
            guard 200..<300 ~= response.statusCode else {
                throw ApiError.connectivity
            }
            return .just(response)
        }
    }
}
