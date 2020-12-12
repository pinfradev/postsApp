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
}

extension PostInteractor: PostRemoteDataManagerOutputProtocol {
    
    // TODO: Implement use case methods
    
    func getPostsSucceded(postResponse: PostResponse) {
        self.presenter?.getPostsSucceded(postResponse: postResponse)
    }
    
    func getPostsFailed(error: String) {
        self.presenter?.getPostsFailed(error: error)
    }
}
