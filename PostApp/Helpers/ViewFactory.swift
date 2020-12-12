//
//  ViewFactory.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import UIKit

enum FactoryView {
    case mainViewController
    case webViewController
}
class ViewFactory: NSObject {
    
    class func getViewController(_ view: FactoryView) -> UIViewController {
        var viewController = UIViewController()
        
        switch view {
        case .mainViewController:
            viewController = self.instantiateVC(id: "\(MainViewController.self)")
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
