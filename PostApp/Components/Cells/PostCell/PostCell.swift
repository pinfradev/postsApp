//
//  PostCell.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var AuthorAndDateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.setupUI()
    }
    
    func setupUI() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.titleLabel.textColor = .black
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(post: CurrentPostModel) {
        var titleText = ""
        var authorDateText = ""
        if let title = post.title {
            titleText = title
        }
        self.titleLabel.text = titleText
        if let author = post.author {
            authorDateText = author
        }
        if let date = post.formattedDate {
            authorDateText += " - " + date
        }
        self.AuthorAndDateLabel.text = authorDateText
    }
    
}
