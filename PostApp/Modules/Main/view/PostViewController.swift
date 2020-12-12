//
//  ViewController.swift
//  PostApp
//
//  Created by Fray Pineda on 12/9/20.
//

import UIKit

class PostViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var refreshControl = UIRefreshControl()
    var postArray = [Post]()
    // MARK: Properties
    var presenter: PostPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setupTableView()
        self.refresh()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    func setupUI() {
        self.view.backgroundColor = .white
    }
    
    func setupTableView() {
        self.tableView.backgroundColor = .clear
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.tableView.registerCell(nibName: "\(PostCell.self)")
        self.refreshControl.addTarget(self, action: #selector(self.refresh), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    
    @objc func refresh() {
        self.presenter?.getPosts()
    }
    
    func relodData() {
        self.tableView.reloadData()
    }
}

extension PostViewController: PostViewProtocol {
    // TODO: implement view output methods
    func getPostsSucceded(postResponse: PostResponse) {
        self.refreshControl.endRefreshing()
        if let posts = postResponse.hits {
            self.postArray = posts
        }
        self.relodData()
    }
    
    func getPostsFailed(error: String) {
        self.refreshControl.endRefreshing()
        print(error)
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(PostCell.self)", for: indexPath)
            as? PostCell {
            cell.setData(post: postArray[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HeightForCell.postCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let webView = ViewFactory.getViewController(.webViewController) as? WebViewController {
            var urlString = ""
            if let url = self.postArray[indexPath.row].url {
                urlString = url
            } else if let url = self.postArray[indexPath.row].storyUrl {
                urlString = url
            }
            webView.urlString = urlString
            self.navigationController?.pushViewController(webView, animated: true)
        }
    }
    
    
}

