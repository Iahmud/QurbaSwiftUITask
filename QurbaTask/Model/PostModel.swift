//
//  PostModel.swift
//  QurbaTask
//
//  Created by Islam Ahmed on 19/03/2023.
//

import Foundation


struct PostRequestModel:Codable
{
    var search: String
    var limit, pageNo: Int
    
    var urlParmeter: String {
        return "q=\(search)&limit=\(limit)&skip=\(pageNo*limit)"
    }
}


struct PostsResponseModel:Codable
{
    var posts: [PostModel]?
    var total, skip: Int?
    var limit: Int?
    
}

struct PostModel:Codable
{
    var id: Int?
    var title, body: String?
    var userId, reactions: Int?
    var tags: [String]?
    
}
