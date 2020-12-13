//
//  PostLocalDataManager.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//  
//

import Foundation


class PostLocalDataManager:PostLocalDataManagerInputProtocol {
    

    private let manager = CoreDataManager()
    
    func getLocalPosts() -> [CurrentPostModel] {
        var postModelArray = [CurrentPostModel]()
            let posts = manager.getCurrentPosts()
            for post in posts {
                var currentPost = CurrentPostModel(id: post.id ?? "")
                currentPost.author = post.author
                currentPost.date = post.date
                currentPost.title = post.title
                currentPost.url = post.url
                postModelArray.append(currentPost)
            }
        
        return postModelArray
    }
    
    
    func saveCurrentPosts(posts: [Post]) {
        var postModelArray = [CurrentPostModel]()
        for post in posts {
            let currentPost = post.getCurrentPostModel()
            postModelArray.append(currentPost)
        }
        manager.saveSeveralPosts(posts: postModelArray)
    }
    
    func deleteLocalDataIL() {
        self.manager.deleteAllData()
    }
    
    func saveDeletedPostIL(post: CurrentPostModel) {
        self.manager.createDeletedPost(id: post.id, title: post.title, date: post.date, author: post.author) {
            print("save deleted post")
        }
    }
    
    func getDeletedPosts() -> [DeletedPost] {
        let deletedPosts = self.manager.getDeletedPosts()
        return deletedPosts
    }
    
}
