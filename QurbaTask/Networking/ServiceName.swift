//
//  ServiceName.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 17/03/2023.
//

import Foundation

enum ServiceName {
    case login(LoginRequestModel)
    case posts(PostRequestModel)
    
    
    func url() -> (serviceUrl: String, body: Data) {
        
        switch self {
        case .login(let user):
            return ("auth/login",bodyBuilder(user))
        case .posts(let post):
            return ("posts/search?" + post.urlParmeter ,Data())
        }
        
        
    }
    
    
    func httpMethodRequest() -> HttpMethodRequest {
        switch self {
        case .login(_):
            return .POST
            
        case .posts(_):
            return .GET
        }
    }
    
    
    private func bodyBuilder<T: Encodable>(_ object:T) -> Data {
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(object) {
            return data
        }
        return Data()
        
    }
    
    
    
}
