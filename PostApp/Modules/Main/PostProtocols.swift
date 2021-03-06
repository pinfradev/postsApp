//
//  PostProtocols.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//  
//

import Foundation
import UIKit

protocol PostViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: PostPresenterProtocol? { get set }
    
    func getPostsSucceded(postResponse: PostResponse)
    func getPostsFailed(error: String)
    
    func gotLocalPostsSucceded(posts: [CurrentPostModel])
    
}

protocol PostWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createPostModule() -> UIViewController
}

protocol PostPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: PostViewProtocol? { get set }
    var interactor: PostInteractorInputProtocol? { get set }
    var wireFrame: PostWireFrameProtocol? { get set }
    
    func getPosts()
    func getLocalPosts()
    func deleteLocalDataVP()
    func saveDeletedPost(post: CurrentPostModel)
}

protocol PostInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
    func getPostsSucceded(postResponse: PostResponse)
    func getPostsFailed(error: String)
    func gotLocalPostIP(posts: [CurrentPostModel])
}

protocol PostInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: PostInteractorOutputProtocol? { get set }
    var localDatamanager: PostLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PostRemoteDataManagerInputProtocol? { get set }
    func getPosts()
    func getLocalPosts()
    func deleteLocalDataPI()
    func saveDeletedPostPI(post: CurrentPostModel)
}

protocol PostDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol PostRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PostRemoteDataManagerOutputProtocol? { get set }
    func getPosts()
}

protocol PostRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    
    func getPostsSucceded(postResponse: PostResponse)
    func getPostsFailed(error: String)
}

protocol PostLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
    func saveCurrentPosts(posts: [Post])
    func getLocalPosts() -> [CurrentPostModel]
    func deleteLocalDataIL()
    func saveDeletedPostIL(post: CurrentPostModel)
    func getDeletedPosts() -> [DeletedPost]
}
