//
//  CustomNavigationController.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import UIKit
import NotificationBannerSwift
import Reachability

class CustomNavigationController: UINavigationController {
    var bannerView = UILabel()
    var offline = false
    let reachability = try? Reachability()
    
    override func viewDidLoad() {
        self.bannerView = UILabel(frame: CGRect(x: 0.0, y: self.view.frame.height - 40.0, width: self.view.frame.width, height: 30.0))
        bannerView.backgroundColor = .black
        bannerView.textColor = .white
        bannerView.textAlignment = .center
    }
    
//    func setupNetworkObserver() {
//        // Register an observer for the network status
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(networkStatusChanged(_:)),
//            name: .reachabilityChanged,
//            object: reachability
//        )
//        do {
//            // Start the network status notifier
//            try reachability?.startNotifier()
//        } catch {
//            print("Unable to start notifier")
//        }
//    }
//    @objc func networkStatusChanged(_ notification: Notification) {
//        print("changed ")
//        let connected = UIViewController().isConnectedToInternet()
//        if connected {
//                self.hideBanner()
//                self.offline = false
//        } else {
//            self.offline = true
//            self.showBanner(title: "offline Mode")
//        }
//    }
    
    func showBanner(title: String) {
        self.bannerView.text = title
        self.view.addSubview(self.bannerView)
    }
    
    func hideBanner() {
        self.bannerView.removeFromSuperview()
    }
}

