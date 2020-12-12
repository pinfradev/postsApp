//
//  Header.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import Alamofire

class Header {
    static func getHeaders() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept" : "application/json"
        ]
        return headers
    }
}
