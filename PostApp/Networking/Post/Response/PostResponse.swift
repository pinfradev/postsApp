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
    
    func getCurrentPostModel() -> CurrentPostModel {
        let id = self.objectID
        var currentPost = CurrentPostModel(id: id)
        currentPost.author = self.author
        if let url = self.url {
            currentPost.url = url
        } else if let storyUrl = self.storyUrl {
            currentPost.url = storyUrl
        }
        if let title = self.url {
            currentPost.title = title
        } else if let storyTitle = self.storyTitle {
            currentPost.title = storyTitle
        }
        currentPost.date = self.createdAt
        return currentPost
    }
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
