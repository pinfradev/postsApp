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
        self.setupUI()
    }
    
    func setupUI() {
        self.contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        self.titleLabel.textColor = .white
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
