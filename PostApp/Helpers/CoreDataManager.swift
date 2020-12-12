//
//  CoreDataManager.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    private var context: NSManagedObjectContext!
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    func createCurrentPost(id: String,
                           title: String?,
                           date: String?,
                           author: String?,
                           url: String,
                           completion: @escaping () -> Void) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let currentPost = CurrentPost(context: self.context)
        currentPost.id = id
        currentPost.title = title
        currentPost.date = date
        currentPost.author = author
        currentPost.url = url
        appDelegate.saveContext()
        
    }
    
    func saveSeveralPosts(posts: [CurrentPostModel]) {
        let entity = NSEntityDescription.entity(forEntityName: "\(CurrentPost.self)", in: self.context)!
        
        for post in posts {
            let newPost = NSManagedObject(entity: entity, insertInto: self.context)
            newPost.setValue(post.id, forKey: Constant.CoreData.id)
            newPost.setValue(post.author, forKey: Constant.CoreData.author)
            newPost.setValue(post.date, forKey: Constant.CoreData.date)
            newPost.setValue(post.title, forKey: Constant.CoreData.title)
            newPost.setValue(post.url, forKey: Constant.CoreData.url)
        }
        
        do {
            try self.context.save()
          } catch {
            print("Failed saving")
          }
    }
    
    func getCurrentPosts() -> [CurrentPost]{
        let fetchRequest: NSFetchRequest<CurrentPost> = CurrentPost.fetchRequest()
        do {
            let result = try self.context.fetch(fetchRequest)
            return result
        } catch {
            print("error getting current Post")
        }
        
        return []
    }
}
