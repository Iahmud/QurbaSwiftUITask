//
//  LoginModel.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 17/03/2023.
//

import Foundation


struct LoginRequestModel:Codable
{
    var username, password: String
}


struct LoginResponseModel:Codable
{
    var id: Int?
    var username, email: String?
    var firstName, lastName: String?
    var gender, image: String?
    var token: String?
    
}
