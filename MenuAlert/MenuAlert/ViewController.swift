//
//  ViewController.swift
//  MenuAlert
//
//  Created by JIHYE SEOK on 5/21/24.
//

import UIKit

class ViewController: UIViewController {

    private lazy var menuButton: UIButton = {
        let menuButton = UIButton(type: .system)
        var conf = UIButton.Configuration.filled()
        conf.title = "Options"
        
        menuButton.configuration = conf
        menuButton.addAction(UIAction{ [weak self] _ in
            self?.showMenu(sourceView: menuButton)
        }, for: .touchUpInside)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        
        return menuButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(menuButton)
        NSLayoutConstraint.activate([
            menuButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            menuButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }


    func showMenu(sourceView: UIView) {
        let alert = UIAlertController(title: "Options", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Open", style: .default) { _ in
            self.showMessage("Open chosen")
        })
        alert.addAction(UIAlertAction(title: "Close", style: .cancel) { _ in
            self.showMessage("Close chosen")
        })
        alert.addAction(UIAlertAction(title: "Warnig", style: .destructive) { _ in
            self.showMessage("Warnig chosen")
        })
        alert.addAction(UIAlertAction(title: "Submenu", style: .default) { [weak self] _ in
            self?.showSubMenu(sourceView: sourceView)
        })
        
        if let popoverController = alert.popoverPresentationController {
            popoverController.sourceView = sourceView
            popoverController.sourceRect = sourceView.bounds
            popoverController.permittedArrowDirections = [.down]
        }
        
        present(alert, animated: true)
    }
    
    func showSubMenu(sourceView: UIView) {
        let submenuAlert = UIAlertController(title: "Submenu", message: nil, preferredStyle: .actionSheet)
        submenuAlert.addAction(UIAlertAction(title: "Copy Format", style: .default, handler: { _ in
            self.showMessage("Copy format chosen")
        }))
        submenuAlert.addAction(UIAlertAction(title: "Paste Format", style: .default, handler: { _ in
            self.showMessage("Paste format chosen")
        }))
        
        if let popoverController = submenuAlert.popoverPresentationController {
            popoverController.sourceView = sourceView
            popoverController.sourceRect = sourceView.bounds
            popoverController.permittedArrowDirections = [.up]
        }
        
        present(submenuAlert, animated: true, completion: nil)
    }
    
    func showMessage(_ message: String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

