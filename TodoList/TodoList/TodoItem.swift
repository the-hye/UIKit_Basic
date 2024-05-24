//
//  TodoItem.swift
//  TodoList
//
//  Created by JIHYE SEOK on 5/24/24.
//

import UIKit

struct TodoItem {
    let id: UUID
    var title: String
    var completed: Bool
    
    init(id: UUID, title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}
