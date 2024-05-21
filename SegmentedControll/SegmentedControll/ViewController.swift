//
//  ViewController.swift
//  SegmentedControll
//
//  Created by JIHYE SEOK on 5/21/24.
//

import UIKit

extension UIColor {
    func appropriateTintColor() -> UIColor {
        var red: CGFloat = 0
        var blue: CGFloat = 0
        var green: CGFloat = 0
        var alpha: CGFloat = 0
        
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let luminance = 0.299 * red + 0.587 * green + 0.114 * blue
        
        return luminance > 0.5 ? UIColor.black : UIColor.white
    }
}

class ViewController: UIViewController {
    
    var count = 0
    let segmentedControl = UISegmentedControl(items: ["Red", "Green", "Blue"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - ButtonUI
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
        
        // MARK: - SementedControll
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addAction(UIAction { [weak self] _ in
            switch self?.segmentedControl.selectedSegmentIndex {
            case 0:
                self?.view.backgroundColor = .red
            case 1:
                self?.view.backgroundColor = .green
            case 2:
                self?.view.backgroundColor = .blue
            default:
                break
            }
            
            let tintColor: UIColor = (self?.view.backgroundColor?.appropriateTintColor())!
            let normalTextAttribute: [NSAttributedString.Key: Any] = [.foregroundColor: tintColor]
            
            self?.segmentedControl.setTitleTextAttributes(normalTextAttribute, for: .normal)
        }, for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.selectedSegmentTintColor = .cyan
        view.addSubview(segmentedControl)
        
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }
    
    
}

