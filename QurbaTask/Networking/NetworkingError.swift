//
//  NetworkingError.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 17/03/2023.
//

import Foundation

enum NetworkingError : Error {
    case internetConnection
    case invalidURL
    case invalidJsonData
    case invalidresponse
    
    func description() -> String
    {
        switch self {
        case .internetConnection:
            return "internetConnection error"
        case .invalidURL:
            return "invalidURL error"
        case .invalidJsonData:
            return "invalidJsonData error"
        case .invalidresponse:
            return "invalidresponse error"
        }
    }
}
