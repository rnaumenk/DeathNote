//
//  AddViewController.swift
//  d02
//
//  Created by Ruslan NAUMENKO on 1/17/19.
//  Copyright © 2019 Ruslan NAUMENKO. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .white
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewFrame), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateViewFrame), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        descriptionView.layer.borderWidth = 1
        descriptionView.textContainer.maximumNumberOfLines = 25
        descriptionView.text = "Details (25 lines)"
        descriptionView.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0)
        
        datePicker.minimumDate = Date()
        datePicker.datePickerMode = .date
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if nameField.isFirstResponder {
            nameField.resignFirstResponder()
        } else if descriptionView.isFirstResponder {
            descriptionView.resignFirstResponder()
        }
    }
    
    @IBAction func doneBtn(_ sender: UIBarButtonItem) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        if descriptionView.textColor == UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0) {
            descriptionView.text = "No details"
        }
        
        print("Name:", nameField.text ?? "Not given", separator: "\n")
        print("Details:", descriptionView.text, separator: "\n")
        print("Date:", dateFormatter.string(from: datePicker.date), separator: "\n")
        
        if (nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)! {
            view.endEditing(true)
            displayAlert(message: "Name is not given")
            return
        }
        
        Corpses.person.append((nameField.text!, descriptionView.text, dateFormatter.string(from: datePicker.date)))
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func updateViewFrame(notification: NSNotification) {
        guard let userinfo = notification.userInfo else {return}
        
        let getKeyBoardRect = (userinfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        switch notification.name {
        case UIResponder.keyboardWillShowNotification:
            if descriptionView.isFirstResponder && descriptionView.frame.origin.y + descriptionView.frame.height > getKeyBoardRect.origin.y {
                view.frame.origin.y -= getKeyBoardRect.height
            }
        default:
            view.frame.origin.y = 0
        }
    }
    
}

extension AddViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        let newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)
        let numberOfChars = newText.count
        return numberOfChars < 100
    }
}

extension AddViewController: UITextViewDelegate {    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let existingLines = textView.text.components(separatedBy: CharacterSet.newlines)
        let newLines = text.components(separatedBy: CharacterSet.newlines)
        let linesAfterChange = existingLines.count + newLines.count - 1
        return linesAfterChange <= textView.textContainer.maximumNumberOfLines
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0) {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Max: 300 symbols / 25 lines"
            textView.textColor = UIColor(red: 102/255, green: 102/255, blue: 102/255, alpha: 1.0)
        }
    }
}
