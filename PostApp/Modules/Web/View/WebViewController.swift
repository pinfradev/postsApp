//
//  WebViewController.swift
//  PostApp
//
//  Created by Fray Pineda on 12/9/20.
//

import UIKit
import WebKit
import Reachability

class WebViewController: UIViewController {

    var urlString: String?
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.webView.navigationDelegate = self
        self.activityIndicator.frame = self.view.frame
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.color = .blue
        self.view.addSubview(self.activityIndicator)
        self.loadWebView()
    }
    
    func loadWebView() {
        if let urlString = self.urlString, let url = URL(string: urlString) {
            let urlRequest = URLRequest(url: url)
            if self.isConnectedToInternet() {
                self.activityIndicator.startAnimating()
                self.webView.load(urlRequest)
            } else {
                DispatchQueue.main.async {
                    self.showBanner(message: "offline mode")
                }
            }
        }
    }

}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        self.activityIndicator.stopAnimating()
        DispatchQueue.main.async {
            self.showBanner(message: "resource not found")
        }
    }
}
