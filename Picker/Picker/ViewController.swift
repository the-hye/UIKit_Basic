//
//  ViewController.swift
//  Picker
//
//  Created by JIHYE SEOK on 5/21/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIColorPickerViewControllerDelegate {
    
    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        
        return pickerView
    }()
    
    private var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        
        return datePicker
    }()
    
    private lazy var colorPicker: UIButton = {
        let button = UIButton()
        var config = UIButton.Configuration.filled()
        
        config.title = "Color Picker"
        config.cornerStyle = .capsule
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addAction(UIAction{ [weak self] _ in
            self?.presentColorPicker()
        }, for: .touchUpInside)
        
        return button
    }()
    
    func setDatePickerUI() {
        let today = Date()
        var dateComponents = DateComponents()
        dateComponents.year = 1
        let oneYearFromNow = Calendar.current.date(byAdding: dateComponents, to: today)
        datePicker.minimumDate = today
        datePicker.maximumDate = oneYearFromNow
        datePicker.addAction(UIAction{ [weak self] _ in
            print("sender: \(self?.datePicker.date.formatted() ?? "N/A")")
        }, for: .valueChanged)
    }
    
    let options = ["Option 1", "Option 2", "Option 3", "Option 4", "Option 5"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDatePickerUI()
        
        view.addSubview(pickerView)
        view.addSubview(datePicker)
        view.addSubview(colorPicker)
        
        NSLayoutConstraint.activate([
            pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pickerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.topAnchor.constraint(equalTo: pickerView.bottomAnchor, constant: 20),
            colorPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            colorPicker.topAnchor.constraint(equalTo: datePicker.bottomAnchor, constant: 20),
        ])
    }
    
    // MARK: - UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        options.count
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return options[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("selected row: \(row)")
    }
    
    // MARK: - UIColorPickerViewControllerDelegate
    
    func presentColorPicker() {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        colorPickerVC.supportsAlpha = false
        colorPickerVC.selectedColor = view.backgroundColor ?? .white
        present(colorPickerVC, animated: true)
    }
    
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        view.backgroundColor = viewController.selectedColor
    }
    
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
}

