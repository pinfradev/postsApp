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
            
            if let deletedPosts = self.localDatamanager?.getDeletedPosts() {
                for deletedPost in deletedPosts {
                    if let index = localPostsArray.firstIndex(where: { (post) -> Bool in
                        post.id == deletedPost.id
                    }) {
                        print(localPostsArray[index])
                        localPostsArray.remove(at: index)
                        continue
                    }
                }
            }
        }
        
        
        self.presenter?.gotLocalPostIP(posts: localPostsArray)
    }
    
    func deleteLocalDataPI() {
        self.localDatamanager?.deleteLocalDataIL()
    }
    
    func saveDeletedPostPI(post: CurrentPostModel) {
        self.localDatamanager?.saveDeletedPostIL(post: post)
    }
}

extension PostInteractor: PostRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func getPostsSucceded(postResponse: PostResponse) {
        var postsToSend = [Post]()
        var responseToSend = postResponse
        if let posts = postResponse.hits {
            self.localDatamanager?.saveCurrentPosts(posts: posts)
        }
        if let deletedPosts = self.localDatamanager?.getDeletedPosts(), let posts = postResponse.hits {
            postsToSend = posts
            for deletedPost in deletedPosts {
                if let index = posts.firstIndex(where: { (post) -> Bool in
                    post.objectID == deletedPost.id
                }) {
                    postsToSend.remove(at: index)
                    continue
                }
            }
            responseToSend.hits = postsToSend
        }
        
        self.presenter?.getPostsSucceded(postResponse: responseToSend)
    }
    
    func getPostsFailed(error: String) {
        self.presenter?.getPostsFailed(error: error)
    }
}
