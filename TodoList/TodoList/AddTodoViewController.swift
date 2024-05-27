//
//  AddTodoViewController.swift
//  TodoList
//
//  Created by JIHYE SEOK on 5/24/24.
//

import UIKit

class AddTodoViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        
        return title
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "할 일 추가하기"
        view.addSubview(titleLabel)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(save))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
    }
    
    @objc func save() {
        
    }
    
    @objc func cancel() {
        dismiss(animated: true)
    }
    
}
