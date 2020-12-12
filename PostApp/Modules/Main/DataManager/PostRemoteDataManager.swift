//
//  PostRemoteDataManager.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//  
//

import Foundation

class PostRemoteDataManager:PostRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: PostRemoteDataManagerOutputProtocol?
    
    func getPosts() {
        PostAPI.shared().getAllPosts() { result in
            switch result {
            case .success( let object):
                self.remoteRequestHandler?.getPostsSucceded(postResponse: object)
            case .failure(let error):
                self.remoteRequestHandler?.getPostsFailed(error: error.localizedDescription)
            }
            
        }
    }
    
}
