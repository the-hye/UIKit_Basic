//
//  ViewController.swift
//  List
//
//  Created by JIHYE SEOK on 5/23/24.
//

import UIKit

struct Animals {
    let name: String
    let image: UIImage
}

class CustomCell: UITableViewCell {
    let animalImageView = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        animalImageView.contentMode = .scaleAspectFit
        animalImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(animalImageView)
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            animalImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            animalImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            animalImageView.widthAnchor.constraint(equalToConstant: 50),
            animalImageView.heightAnchor.constraint(equalToConstant: 50),
            
            nameLabel.leadingAnchor.constraint(equalTo: animalImageView.trailingAnchor, constant: 16),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(item: Animals) {
        animalImageView.image = item.image
        nameLabel.text = item.name
    }
}

class ViewController: UIViewController, UITableViewDataSource {
    let animals = [
        Animals(name: "고양이", image: UIImage(systemName: "cat")!),
        Animals(name: "강아지", image: UIImage(systemName: "dog")!),
        Animals(name: "토끼", image: UIImage(systemName: "hare")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
//        var config = cell.defaultContentConfiguration()
//        config.text = animals[indexPath.row].name
//        config.image = animals[indexPath.row].image
//        cell.contentConfiguration = config
        let animal: Animals = animals[indexPath.row]
        cell.configure(item: animal)
        return cell
    }
    
}
