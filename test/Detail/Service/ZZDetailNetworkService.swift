//
//  ZZDetailNetworkService.swift
//  test
//
//  Created by Max on 2021/12/20.
//  Copyright © 2021 Max. All rights reserved.
//

import Foundation
import Moya

enum SubscriptionApi {
    case information
}

extension SubscriptionApi: TargetType{
    
    var headers: [String : String]? { nil }
    var baseURL: URL{ URL(string: "https://gist.githubusercontent.com")!}
    var path: String{ "heinhtetaung92/fbfd371881e6982c71971eedd5732798/raw/00e14e0e5502dbcf1ea9a2cdc44324fd3a5492e7/test.json" }
    var method: Moya.Method {.get}
    var task: Task {.requestPlain}
    var sampleData: Data {
        return "{\"msg\": \"test\"}".utf8Encoded
    }
}

let subscriptionProvider = MoyaProvider<SubscriptionApi>()
