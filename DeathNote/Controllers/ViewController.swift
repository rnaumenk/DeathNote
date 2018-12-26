//
//  ViewController.swift
//  DeathNote
//
//  Created by Ruslan on 12/9/18.
//  Copyright © 2018 Ruslan Naumenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descTextView: UITextView!
    
    override func viewDidLoad() {
        datePicker.minimumDate = Date()
        descTextView.layer.borderWidth = 1.0
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameTextField.resignFirstResponder()
        descTextView.resignFirstResponder()
    }
    
    @IBAction func doneButton(_ sender: Any) {
        
        let dateFormat = DateFormatter()
        
        dateFormat.dateFormat = "dd MMMM yyyy"
        
        if nameTextField.text != "" {
            print(nameTextField.text!)
        }
        
        print(dateFormat.string(from: datePicker.date))
        
        if descTextView.text != "" {
            print(descTextView.text!)
        }
        
        if nameTextField.text != "" {
            Data.corpses.append((nameTextField.text!, descTextView.text!, dateFormat.string(from: datePicker.date)))
            navigationController?.popViewController(animated: true)
        }
    }
    
}
