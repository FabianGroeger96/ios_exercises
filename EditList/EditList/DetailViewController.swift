//
//  DetailViewController.swift
//  EditList
//
//  Created by Fabian Gröger on 10.10.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var postCodeLabel: UILabel!
    
    var personData: PersonData?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        firstNameLabel.text = personData!.firstName
        lastNameLabel.text = personData!.lastName
        postCodeLabel.text = String(personData!.plz)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editDetail" {
            let controller = segue.destination as! EditViewController
            controller.person = self.personData
        }
    }
}

