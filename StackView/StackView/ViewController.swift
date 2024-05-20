//
//  ViewController.swift
//  StackView
//
//  Created by JIHYE SEOK on 5/20/24.
//

import UIKit

class ViewController: UIViewController {
    let toggleSwitch = UISwitch()
    let stepper = UIStepper()
    let label1 = UILabel()
    let label2 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let stackView = UIStackView()
        //        stackView.axis = .vertical
        //        stackView.spacing = 10
        //        stackView.alignment = .center
        //        stackView.distribution = .fillEqually
        //
        //        let topLabel = UILabel()
        //        topLabel.text = "위"
        //        topLabel.textAlignment = .center
        //        topLabel.backgroundColor = .cyan
        //
        //        let leftLabel = UILabel()
        //        leftLabel.text = "왼쪽"
        //        leftLabel.textAlignment = .center
        //        leftLabel.backgroundColor = .lightGray
        //
        //        let rightLabel = UILabel()
        //        rightLabel.text = "오른쪽"
        //        rightLabel.textAlignment = .center
        //        rightLabel.backgroundColor = .lightGray
        //
        //        let hStackView = UIStackView(arrangedSubviews: [leftLabel, rightLabel])
        //        hStackView.axis = .horizontal
        //        hStackView.spacing = 10
        //
        //        stackView.addArrangedSubview(topLabel)
        //        stackView.addArrangedSubview(hStackView)
        //        view.addSubview(stackView)
        //
        //        stackView.translatesAutoresizingMaskIntoConstraints = false
        //
        //        NSLayoutConstraint.activate([
        //            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        //            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        //            stackView.widthAnchor.constraint(equalToConstant: 200),
        //            stackView.heightAnchor.constraint(equalToConstant: 100)
        //        ])
        
        label1.text = "Switch is OFF"
        label1.textAlignment = .center
        
        //toggleSwitch.addTarget(self, action: #selector(switchChanged), for: .valueChanged)
        toggleSwitch.addAction(UIAction { [weak self] _ in
            if let isOn = self?.toggleSwitch.isOn, isOn {
                self?.label1.text = "Switch is ON"
            } else {
                self?.label1.text = "Switch is OFF"
            }
        }, for: .valueChanged)
        
        let stackView = UIStackView(arrangedSubviews: [label1, toggleSwitch])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        
        view.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        label2.text = "값 : 0"
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.value = 0
        stepper.addAction(UIAction { [weak self] _ in
            self?.label2.text = "값: \(self?.stepper.value ?? 0)"
        }, for: .valueChanged)
        
        let stackView2 = UIStackView(arrangedSubviews: [label2, stepper])
        stackView2.axis = .vertical
        stackView2.spacing = 10
        stackView2.alignment = .center
        
        view.addSubview(stackView2)
        
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func switchChanged(_ sender: UISwitch) {
        if sender.isOn {
            label1.text = "Switch is ON"
        } else {
            label1.text = "Switch is OFF"
        }
    }
}

