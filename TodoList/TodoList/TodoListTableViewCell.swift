//
//  TodoListTableViewCell.swift
//  TodoList
//
//  Created by JIHYE SEOK on 5/24/24.
//

import UIKit

class TodoListTableViewCell: UITableViewCell {

    var title: UILabel = {
        let title = UILabel()
        title.text = "노는게 제일 좋아"
        title.translatesAutoresizingMaskIntoConstraints = false
//        title.textColor = .black
        return title
    }()
    
    var complete: UISwitch = {
        let completeToggle = UISwitch()
        completeToggle.translatesAutoresizingMaskIntoConstraints = false
        completeToggle.addAction(UIAction { /*[weak self]*/ _ in
            if completeToggle.isOn {
                print("토글 켜졌다")
            } else {
                print("토글 꺼졌다")
            }
        }, for: .valueChanged)
        
        return completeToggle
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(title)
        addSubview(complete)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            title.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            title.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor, constant: 8),
            complete.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            complete.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            complete.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor, constant: -8),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuration(todoItem: TodoItem) {
        title.text = todoItem.title
        complete.isOn = todoItem.completed
    }
    
}
