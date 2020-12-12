//
//  RequestType.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import Alamofire

enum HttpMethod: String {
    case get = "GET"
    case delete = "DELETE"
    case post = "POST"
    case put = "PUT"
}


enum RequestParameter {
        case none
}

protocol RequestType {
    var basicUrl: String { get }
    
    var path: String { get }
    
    var method: HttpMethod { get }
    
    var parameters: RequestParameter { get }
    
    var headers: HTTPHeaders? { get }
}
