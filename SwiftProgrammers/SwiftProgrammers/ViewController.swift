//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by Fabian Gröger on 18.09.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let usePersonData: Bool = true
    
    let labelWidth = 350
    let labelHeight = 100
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dataProvider = DataProvider.sharedInstance
        
        let titleLabel = getTitleLabel(text: "Swift Programmierer", frame: CGRect(x: 0, y: 50, width: self.labelWidth, height: self.labelHeight))
        self.view.addSubview(titleLabel)
        
        if usePersonData{
            for (index, person) in dataProvider.memberPersons.enumerated() {
                addLabel(person: person, position: index + 1)
            }
        } else {
            for (index, name) in dataProvider.memberNames.enumerated() {
                addLabel(text: name, position: index + 1)
            }
        }
    }
    
    func getTitleLabel(text: String, frame: CGRect) -> UILabel {
        
        let label = UILabel(frame: frame)
        label.center.x = self.view.center.x
        label.text = text
        label.textAlignment = .center
        label.textColor = .orange
        label.font = UIFont(name: "Arial", size: 24)
        
        return label
    }
    
    func addLabel(text: String, position: Int) {
        let frame = CGRect(x: 30, y: 100 + (position * 50), width: self.labelWidth, height: self.labelHeight)
        let label = UILabel(frame: frame)
        
        label.text = text
        label.textAlignment = getAlignment(position: position)
        label.textColor = getColor(position: position)
        
        self.view.addSubview(label)
    }
    
    func getAlignment(position: Int) -> NSTextAlignment {
        var alignment: NSTextAlignment
        
        switch position % 2 {
        case 1:
            alignment = .left
        default:
            alignment = .right
        }
        
        return alignment
    }
    
    func getColor(position: Int) -> UIColor {
        var color: UIColor
        
        switch position % 3 {
        case 1:
            color = .green
        case 2:
            color = .white
        default:
            color = .red
        }
        
        return color
    }
    
    func addLabel(person: PersonData, position: Int) {
        let fontSize: CGFloat = 17
        
        let firstName = UILabel(frame: CGRect(x: 10, y: 100 + (position * 50), width: 150, height: 50))
        firstName.text = person.firstName
        firstName.font = UIFont(name: "Arial", size: fontSize)
        firstName.textColor = UIColor.green
        
        let lastName = UILabel(frame: CGRect(x: 160, y: 100 + (position * 50), width: 150, height: 50))
        lastName.text = person.lastName
        lastName.font = UIFont(name: "Arial", size: fontSize)
        lastName.textColor = UIColor.green
        
        let plz = UILabel(frame: CGRect(x: 310, y: 100 + (position * 50), width: 50, height: 50))
        plz.text = String(person.plz)
        plz.font = UIFont(name: "Arial", size: fontSize)
        plz.textColor = UIColor.green
        plz.textAlignment = NSTextAlignment.right
        
        self.view.addSubview(firstName)
        self.view.addSubview(lastName)
        self.view.addSubview(plz)
    }
}
