//
//  ViewController.swift
//  CustomDatePicker
//
//  Created by JIHYE SEOK on 5/22/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    private lazy var datePicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    let years = [Int](2000...2050)
    let months = [Int](1...12)
    var days = [Int](1...31)
    
    var selectedYear = 2000
    var selectedMonth = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(datePicker)
        
        NSLayoutConstraint.activate([
            datePicker.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    // MARK: - UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return years.count
        case 1:
            return months.count
        case 2:
            return daysInMonth(year: selectedYear, month: selectedMonth)
        default:
            return 0
        }
    }
    
    // MARK: - UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(years[row])
        case 1:
            return String(months[row])
        case 2:
            return String(row + 1)
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch component {
        case 0:
            selectedYear = years[row]
        case 1:
            selectedMonth = months[row]
        default:
            break
        }
        pickerView.reloadComponent(2)
    }
    
    private func daysInMonth(year: Int, month: Int) -> Int {
        switch month {
        case 2:
            return (isLeapYear(year) ? 29 : 28)
        case 4, 6, 9, 11:
            return 30
        default:
            return 31
        }
    }
    
    private func isLeapYear(_ year: Int) -> Bool {
        return (year % 400 == 0) ? true : (year % 100 == 0) ? false : (year % 4 == 0) ? true : false
    }
}
