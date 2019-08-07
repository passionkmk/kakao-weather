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
            return parameter
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
    func build() { //  -> RouterResponse
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
                                    // TODO: - Handler
                                    break
                                case .failure(let failure):
                                    break
                                }
                                
        }
    }
}
