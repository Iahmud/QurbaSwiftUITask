//
//  NetworkingManager.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 17/03/2023.
//

import Foundation

class NetworkingManager : NSObject {
    static func fetchdata<T:Decodable>(_ serviceName:ServiceName,
                                       completion: @escaping (Result<T?,NetworkingError>) -> ())
    {
        
        guard InternetConnection.isInternetAvailable()
        else{completion(.failure(.internetConnection))
            return }
        
        let urlRequest = requestBuilder(serviceName)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data else { completion(.failure(.invalidresponse))
                return}
            do {
                let DicData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(DicData))
                return
            }catch{
                completion(.failure(.invalidJsonData))
                return
            }
            
        }
        
        task.resume()
    }
    
    
    private static func requestBuilder(_ serviceName:ServiceName) -> URLRequest {
        let baseURL = "https://dummyjson.com/"
        let serviceUrl = baseURL + serviceName.url().serviceUrl
        let encodedUrl =  serviceUrl.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        let url = URL(string: encodedUrl)
        var request = URLRequest(url: url!,timeoutInterval: Double.infinity)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = serviceName.httpMethodRequest().rawValue
        request.httpBody = serviceName.url().body
        return request
    }
    
    
    
    
}
