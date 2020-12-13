//
//  PostPresenter.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//  
//

import Foundation

class PostPresenter  {
    
    // MARK: Properties
    weak var view: PostViewProtocol?
    var interactor: PostInteractorInputProtocol?
    var wireFrame: PostWireFrameProtocol?
    
}

extension PostPresenter: PostPresenterProtocol {
    
    // TODO: implement presenter methods
    
    func getPosts() {
        self.interactor?.getPosts()
    }
    
    func getLocalPosts() {
        self.interactor?.getLocalPosts()
    }
    
    func deleteLocalDataVP() {
        self.interactor?.deleteLocalDataPI()
    }
   
    func saveDeletedPost(post: CurrentPostModel) {
        self.interactor?.saveDeletedPostPI(post: post)
    }
}

extension PostPresenter: PostInteractorOutputProtocol {
    func gotLocalPostIP(posts: [CurrentPostModel]) {
        self.view?.gotLocalPostsSucceded(posts: posts)
    }
    
    // TODO: implement interactor output methods
    func getPostsSucceded(postResponse: PostResponse) {
        self.view?.getPostsSucceded(postResponse: postResponse)
    }
    
    func getPostsFailed(error: String) {
        self.view?.getPostsFailed(error: error)
    }
}
