//
//  ViewController.swift
//  ModalDemo
//
//  Created by Fabian Gröger on 02.10.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var appearanceCounter : Int = 0

    @IBOutlet weak var counterLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // because 2 VC have the same class (one has the label, the other not)
        if counterLabel != nil {
            appearanceCounter += 1
            counterLabel.text = String(appearanceCounter) + ". appearance"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showSecondView(_ sender: UIButton) {
        let secondViewController : SecondViewController = SecondViewController()
        secondViewController.modalPresentationStyle = .fullScreen
        secondViewController.modalTransitionStyle = .partialCurl
        
        // variant 1:
        //self.present(secondViewController, animated: true, completion: nil)
        
        // variant 2:
        self.show(secondViewController, sender: sender)
        
        // the calling ViewController can decide how the new VC is presented
    }
    
    @IBAction func unwindToFirst(_ sender: UIStoryboardSegue){}
    
    @IBAction func backCostumAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

