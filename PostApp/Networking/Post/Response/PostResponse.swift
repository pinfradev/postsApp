//
//  PostResponse.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation

struct PostResponse: Codable {
    var hits: [Post]?
    var page: Int?
    var nbPages: Int?
}

struct Post: Codable {
    var title: String?
    var storyTitle: String?
    var url: String?
    var author: String?
    var createdAt: String?
    var storyUrl: String?
    var objectID: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case storyTitle = "story_title"
        case url
        case author
        case createdAt = "created_at"
        case storyUrl = "story_url"
        case objectID
    }
}
