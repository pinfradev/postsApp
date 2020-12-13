//
//  CurrentPostModel.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation

struct CurrentPostModel {
    var id: String
    var title: String?
    var url: String?
    var author: String?
    var date: String?
    
    var formattedDate: String? {
        get {
            if let stringDate = date {
                let formatter = DateFormatter()
                formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
                if let date = formatter.date(from: stringDate) {
                    formatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
                    let finalDate = formatter.string(from: date)
                    return finalDate
                }
            }
            return self.date
        }
    }
}
