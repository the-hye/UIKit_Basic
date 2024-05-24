//
//  ViewController.swift
//  NavigationController
//
//  Created by JIHYE SEOK on 5/23/24.
//

import UIKit

class ViewController: UIViewController, NextViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "네비게이션 타이틀"

        if let navigationController = navigationController {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = .orange
            appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationController.navigationBar.standardAppearance = appearance
            navigationController.navigationBar.scrollEdgeAppearance = appearance
        }
        
        let leftButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(leftButtonTapped))
        self.navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(title: "완료", style: .done, target: self, action: #selector(rightButtonTapped))
        let extraButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(extraButtonTapped))
        
        self.navigationItem.rightBarButtonItems = [rightButton, extraButton]
        
        let button = UIButton(type: .system)
        button.setTitle("다음 화면으로", for: .normal)
        button.addAction(UIAction { [weak self] _ in
            let animal = Animal(name: "호랑이")
            let nextViewController = NextViewController(animal: animal)
            nextViewController.delegate = self
            nextViewController.view.backgroundColor = .lightGray
            self?.show(nextViewController, sender: nil)
        }, for: .touchUpInside)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        view.addSubview(button)
    }
    
    func save(animal: Animal) {
        print(">>> \(animal.name)")
    }
    
    @objc func leftButtonTapped() {
        print("왼쪽 버튼 탭됨")
    }
    
    @objc func rightButtonTapped() {
        print("오른쪽 버튼 탭됨")
    }
    
    @objc func extraButtonTapped() {
        print("추가 버튼 탭됨")
    }
    
}

