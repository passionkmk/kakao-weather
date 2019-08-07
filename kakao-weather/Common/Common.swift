//
//  Common.swift
//  kakao-weather
//
//  Created by 김민구 on 07/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation

typealias RouterResponse = (data: Data, code: Int)
typealias ApiResult = (Data?)

enum Host {
    static let base: String = "weather-ydn-yql.media.yahoo.com"
    
    static let appId: String = "h80UJe3c"
    static let clientId: String = "dj0yJmk9Rk51cW4zZ1hWeGEwJmQ9WVdrOWFEZ3dWVXBsTTJNbWNHbzlNQS0tJnM9Y29uc3VtZXJzZWNyZXQmc3Y9MCZ4PWE2"
    static let clientSecret: String = "94a7f4f721907b9bbb3a3d95950246a2ee6cdfa1"
}

enum HTTPMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}
