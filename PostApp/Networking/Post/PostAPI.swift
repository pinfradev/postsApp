//
//  PostApi.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation

class PostAPI: APIBasis<PostNetworking> {
    
    private static var sharedPostAPI: PostAPI = {
       let postAPI = PostAPI()
       return postAPI
    }()
    
    class func shared() -> PostAPI {
        return self.sharedPostAPI
    }
    
    func getAllPosts(completion: @escaping(Result<PostResponse,NSError>) -> Void) {
        self.basicRequest(requestType: .getPosts, responseClass: PostResponse.self) { result in
            switch result {
            case .success(let object):
                completion(.success(object))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
