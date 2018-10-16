//
//  EditViewController.swift
//  EditList
//
//  Created by Fabian Gröger on 11.10.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var postCodeTextField: UITextField!
    
    var person: PersonData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        postCodeTextField.delegate = self
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(EditViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        loadData()
    }
    
    func loadData() {
        if let p = self.person {
            if let textField = self.firstNameTextField {
                textField.text = p.firstName
            }
            if let textField = self.lastNameTextField {
                textField.text = p.lastName
            }
            if let textField = self.postCodeTextField {
                textField.text = String(p.plz)
            }
        }
    }
    
    @IBAction func saveAndExitPressed(_ sender: UIButton) {
        person?.firstName = firstNameTextField.text ?? ""
        person?.lastName = lastNameTextField.text ?? ""
        person?.plz = Int(postCodeTextField.text ?? "0") ?? 0
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
