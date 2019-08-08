//
//  Router.swift
//  kakao-weather
//
//  Created by 김민구 on 07/08/2019.
//  Copyright © 2019 pkmk. All rights reserved.
//

import Foundation
import OAuthSwift

// MARK: - Main
enum Router {
    case weather(parameter: [String: Any])
    
    public func request(completion: @escaping (ApiResult) -> Void) {
        build(successCompletion: { (suc) in
            d(">>> [Success]: ==== CODE: [\(suc.code)]")
            completion(suc.data)
        }) { (fail) in
            d(">>> [Error]: \(String(describing: fail.message)) ==== CODE: [\(fail.code)]")
            completion(nil)
        }
    }
}

// MARK: - Value
extension Router {
    private var path: String {
        switch self {
        case .weather:
            return "/forecastrss"
        }
    }
    
    private var parameter: [String: Any] {
        switch self {
        case .weather(let parameter):
            var param = parameter
            param.updateValue("json", forKey: "format")
            param.updateValue("c", forKey: "u")
            return param
        }
    }
    
    private var headers: [String: String] {
        return [
            "X-Yahoo-App-Id": Host.appId
        ]
    }
    
    private var oauth: OAuth1Swift {
        return OAuth1Swift(consumerKey: Host.clientId, consumerSecret: Host.clientSecret)
    }
    
    private var method: String {
        return HTTPMethod.get.rawValue
    }
    
    private var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = Host.base
        urlComponents.path = path
        return urlComponents
    }
}

// MARK: - Function
extension Router {
    private func build(successCompletion: @escaping (Success) -> Void, failureCompletion: @escaping (Failure) -> Void) {
        guard let url = urlComponents.url else {
            return
        }
        
        oauth.client.request(url,
                             method: .GET,
                             parameters: parameter,
                             headers: headers,
                             checkTokenExpiration: true) { (result) in
                                switch result {
                                case .success(let success):
                                    d(">>> \(url.absoluteString)")
                                    let completion: Success = (success.data, success.response.statusCode)
                                    successCompletion(completion)
                                    break
                                case .failure(let failure):
                                    let completion: Failure = (failure.description, failure.errorCode)
                                    failureCompletion(completion)
                                    break
                                }
                                
        }
    }
}
