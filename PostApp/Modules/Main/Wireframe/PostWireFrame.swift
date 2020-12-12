//
//  PostWireFrame.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//  
//

import Foundation
import UIKit

class PostWireFrame: PostWireFrameProtocol {

    class func createPostModule() -> UIViewController {
        let viewController = ViewFactory.getViewController(.postViewController)
        if let view = viewController as? PostViewController {
            let presenter: PostPresenterProtocol & PostInteractorOutputProtocol = PostPresenter()
            let interactor: PostInteractorInputProtocol & PostRemoteDataManagerOutputProtocol = PostInteractor()
            let localDataManager: PostLocalDataManagerInputProtocol = PostLocalDataManager()
            let remoteDataManager: PostRemoteDataManagerInputProtocol = PostRemoteDataManager()
            let wireFrame: PostWireFrameProtocol = PostWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return viewController
        }
        return UIViewController()
    }
    
}
