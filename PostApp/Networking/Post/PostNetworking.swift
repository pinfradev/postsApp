//
//  PostNetworking.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import Alamofire

enum PostNetworking {
    case getPosts
}

extension PostNetworking: RequestType {
    var basicUrl: String {
        return "https://hn.algolia.com"
    }
    
    var path: String {
        return "/api/v1/search_by_date?query=ios"
    }
    
    var method: HttpMethod {
        return .get
    }
    
    var parameters: RequestParameter {
        return .none
    }
    
    var headers: HTTPHeaders? {
        return Header.getHeaders()
    }
    
    
}
