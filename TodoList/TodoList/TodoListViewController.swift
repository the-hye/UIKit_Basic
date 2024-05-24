//
//  TodoListViewController.swift
//  TodoList
//
//  Created by JIHYE SEOK on 5/24/24.
//

import UIKit

class TodoListViewController: UIViewController, UITableViewDataSource {

    var todoItems: [TodoItem] = []
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Todo List"
        self.view.backgroundColor = .white
        
        if let navigationController = navigationController {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .systemOrange
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        }
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        let todoItem = todoItems[indexPath.row]
//        //cell.text
        return cell
    }
    
    @objc func addTodo() {
        
    }
}
