//
//  ViewController.swift
//  IB-Demo
//
//  Created by Fabian Gröger on 25.09.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var sliderAlertShown = false
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var spinnerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        sliderLabel.text =  String(format: "%.2f", sender.value)
        
        if sender.value > Float(90) && self.sliderAlertShown == false {
            
            self.sliderAlertShown = true
            
            let alertController = UIAlertController(
                title: "Alert",
                message: "You've reached 90%!",
                preferredStyle: .alert
            )
            let alertOkAction = UIAlertAction(
                title: "OK",
                style: .destructive,
                handler: nil
            )
            alertController.addAction(alertOkAction)
            self.present(alertController, animated: true, completion: nil)
        } else if sender.value < Float(90) && self.sliderAlertShown == true {
            self.sliderAlertShown = false
        }
    }
    
    @IBAction func colorButtonValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1:
            self.view.backgroundColor = .gray
        default:
            self.view.backgroundColor = .white
        }
    }
    
    @IBAction func spinButtonPressed(_ sender: UIButton) {
        if spinner.isAnimating {
            spinnerButton.setTitle("start spinning", for: .normal)
            spinner.stopAnimating()
        } else {
            spinnerButton.setTitle("stop spinning", for: .normal)
            spinner.startAnimating()
        }
    }
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController( title: "Information",
                                                 message: "Congratulations, you just pressed the i-Button at the top right! It looks like you're enjoying this beautiful application... ;-)",
                                                 preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(
            title: "OK", style: .default,
            handler: nil)
        let cancelAction = UIAlertAction(
            title: "...really?", style: .cancel,
            handler: nil)
        
        alertController.addAction(defaultAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}

