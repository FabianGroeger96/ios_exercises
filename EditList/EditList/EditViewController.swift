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
        
        ConfigureView()
    }
    
    func ConfigureView() {
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
        person?.firstName = firstNameTextField.text!
        person?.lastName = lastNameTextField.text!
        // When string is Not convertable to Int --> set value to 0.
        person?.plz = Int(postCodeTextField.text!) ?? 0
        self.dismiss(animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
