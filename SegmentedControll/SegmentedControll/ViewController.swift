//
//  ViewController.swift
//  SegmentedControll
//
//  Created by JIHYE SEOK on 5/21/24.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: .custom)
        var config = UIButton.Configuration.filled()
        
        config.cornerStyle = .medium
        config.title = "Click Me"
        config.baseBackgroundColor = .systemBlue
        config.baseForegroundColor = .white
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20)
        
        button.configuration = config
        
        button.addAction(UIAction { _ in
            self.count += 1
            print("Button was tapped! \(self.count)")
        }, for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
    }
    
    
}

