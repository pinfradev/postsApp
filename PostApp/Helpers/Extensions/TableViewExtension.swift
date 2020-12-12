//
//  TableViewExtension.swift
//  PostApp
//
//  Created by Fray Pineda on 12/12/20.
//

import Foundation
import UIKit

extension  UITableView {
    func registerCell(nibName: String) {
        let nib = UINib(nibName: nibName, bundle: nil)
        self.register(nib, forCellReuseIdentifier: nibName)
    }
}
