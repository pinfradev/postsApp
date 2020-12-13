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
    var postArray = [CurrentPostModel]()
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
        if self.isConnectedToInternet() {
            self.postArray.removeAll()
            self.presenter?.deleteLocalDataVP()
            self.presenter?.getPosts()
        } else {
            DispatchQueue.main.async {
                self.showBanner(message: "Offline mode")
            }
            self.refreshControl.endRefreshing()
            self.presenter?.getLocalPosts()
        }
    }
    
    func relodData() {
        self.tableView.reloadData()
    }
}

extension PostViewController: PostViewProtocol {
    func gotLocalPostsSucceded(posts: [CurrentPostModel]) {
        print(posts)
        self.postArray = posts
        self.tableView.reloadData()
    }
    
    // TODO: implement view output methods
    func getPostsSucceded(postResponse: PostResponse) {
        self.refreshControl.endRefreshing()
        if let posts = postResponse.hits {
            for post in posts {
                let currentPost = post.getCurrentPostModel()
                self.postArray.append(currentPost)
            }
        }
        self.relodData()
    }
    
    func getPostsFailed(error: String) {
        self.refreshControl.endRefreshing()
        print(error)
    }
    
    private func deleteCell(indexPath: IndexPath) -> UIContextualAction {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self](_, _, _) in
            guard let self = self else {return}
            print(self.postArray[indexPath.row])
            self.presenter?.saveDeletedPost(post: self.postArray[indexPath.row])
            self.postArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        return action
    }
}

extension PostViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "\(PostCell.self)", for: indexPath)
            as? PostCell {
            if indexPath.row < postArray.count {
                cell.setData(post: postArray[indexPath.row])
            }
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
            }
            webView.urlString = urlString
            self.navigationController?.pushViewController(webView, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = self.deleteCell(indexPath: indexPath)
        let swipe = UISwipeActionsConfiguration(actions: [delete])
        return swipe
    }
    
    
}

