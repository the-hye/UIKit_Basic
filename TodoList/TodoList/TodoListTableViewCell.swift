//
//  TodoListTableViewCell.swift
//  TodoList
//
//  Created by JIHYE SEOK on 5/24/24.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    private var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = true
        
        return title
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
