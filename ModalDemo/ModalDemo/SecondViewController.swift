//
//  SecondViewController.swift
//  ModalDemo
//
//  Created by Fabian Gröger on 02.10.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
