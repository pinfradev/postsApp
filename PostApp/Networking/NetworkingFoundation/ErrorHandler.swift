//
//  ErrorHandler.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation

struct ErrorHandler {
    static let generalError = "Ha ocurrido un error"
    
    static let errorCode = ["200": "OK",
                            "400": "Bad Request",
                            "401": "UnAuthorized",
                            "403": "Forbidden",
                            "404": "Not Found",
                            "500": "Something went wrong",
                            "503": "Something went wrong"]
}
