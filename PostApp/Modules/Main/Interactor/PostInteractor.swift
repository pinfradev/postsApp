//
//  PostInteractor.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//  
//

import Foundation

class PostInteractor: PostInteractorInputProtocol {
    
    
    // MARK: Properties
    weak var presenter: PostInteractorOutputProtocol?
    var localDatamanager: PostLocalDataManagerInputProtocol?
    var remoteDatamanager: PostRemoteDataManagerInputProtocol?

    func getPosts() {
        self.remoteDatamanager?.getPosts()
    }
    
    func getLocalPosts() {
        var localPostsArray = [CurrentPostModel]()
        if let localPosts = self.localDatamanager?.getLocalPosts() {
            for localPost in localPosts {
                let post = CurrentPostModel(id: localPost.id,
                                            title: localPost.title,
                                            url: localPost.url,
                                            author: localPost.author,
                                            date: localPost.date)
                localPostsArray.append(post)
            }
        }
        self.presenter?.gotLocalPostIP(posts: localPostsArray)
    }
    
    func deleteLocalDataPI() {
        self.localDatamanager?.deleteLocalDataIL()
    }
}

extension PostInteractor: PostRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func getPostsSucceded(postResponse: PostResponse) {
        if let posts = postResponse.hits {
            self.localDatamanager?.saveCurrentPosts(posts: posts)
        }
        self.presenter?.getPostsSucceded(postResponse: postResponse)
    }
    
    func getPostsFailed(error: String) {
        self.presenter?.getPostsFailed(error: error)
    }
}
