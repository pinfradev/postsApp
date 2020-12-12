//
//  ViewControllerExtension.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import Reachability
import NotificationBannerSwift
import UIKit

extension UIViewController {
    
    func isConnectedToInternet() -> Bool {
        let reachability = try? Reachability()
        if let reachability = reachability {
            switch reachability.connection {
            case .unavailable, .none:
                return false
            default:
                return true
            }
        }
        return true
    }
    
    func showBanner(message: String) {
        let banner = NotificationBanner(customView: self.getCustomView(message: message))
        banner.show(bannerPosition: .bottom, on: self)
        
    }
    
    func getCustomView(message: String) -> UIView {
        let view = UILabel(frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: 30.0))
        view.backgroundColor = .black
        view.textColor = .white
        view.textAlignment = .center
        view.text = message
        return view
    }
}
