//
//  ViewFactory.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import UIKit

enum FactoryView {
    case postViewController
    case webViewController
}
class ViewFactory: NSObject {
    
    class func getViewController(_ view: FactoryView) -> UIViewController {
        var viewController = UIViewController()
        
        switch view {
        case .postViewController:
            viewController = self.instantiateVC(id: "\(PostViewController.self)")
        case .webViewController:
            viewController = self.instantiateVC(id: "\(WebViewController.self)")
        }

        return viewController
    }
    
    class func instantiateVC(id: String) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: id)
        return vc
    }
}
