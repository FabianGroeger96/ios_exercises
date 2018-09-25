//
//  ViewController.swift
//  SwiftProgrammers
//
//  Created by Fabian Gröger on 18.09.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import UIKit

class ViewControllerOld: UIViewController {
    
    let positionInit: Float = 200
    let positionRow: Float = 50
    
    let usePersonData = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create the title label
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 345, height: 30))
        titleLabel.center.x = self.view.center.x
        titleLabel.center.y = 120
        titleLabel.textAlignment = .center
        titleLabel.text = "Swift Programmierer"
        titleLabel.textColor = .orange
        titleLabel.font = titleLabel.font.withSize(22)
        self.view.addSubview(titleLabel)
        
        let dataProvider = DataProvider.sharedInstance
        
        if usePersonData {
            var position: Int = Int(positionInit)
            for person in dataProvider.memberPersons {
                addLabel(person: person, position: position)
                position += Int(positionRow)
            }
        } else {
            var position: Float = positionInit
            for name in dataProvider.memberNames {
                addLabel(name: name, position: position)
                position += positionRow
            }
        }
    }

    func addLabel(name: String, position: Float) {
        let label = UILabel(frame: CGRect(x: 0, y: Int(position), width: 345, height: 30))
        label.center.x = self.view.center.x
        label.text = name
        label.textColor = getLabelColor(position: Int(position))
        label.textAlignment = getTextAlignment(position: Int(position))
        self.view.addSubview(label)
    }
    
    func addLabel(person: PersonData, position: Int) {
        let coordinates = (x: 30, y: position)
        
        let rectangleLeft = CGRect(x: coordinates.x + 0, y: coordinates.y, width: 130, height: 30)
        let labelLeft = UILabel(frame: rectangleLeft)
        labelLeft.text = person.firstName
        labelLeft.textColor = .green
        
        let rectangleCenter = CGRect(x: coordinates.x + 130, y: coordinates.y, width: 130, height: 30)
        let labelCenter = UILabel(frame: rectangleCenter)
        labelCenter.text = person.lastName
        labelCenter.textColor = .green
        
        let rectangleRight = CGRect(x: coordinates.x + 260, y: coordinates.y, width: 130, height: 30)
        let labelRight = UILabel(frame: rectangleRight)
        labelRight.text = String(person.plz)
        labelRight.textColor = .green
        
        self.view.addSubview(labelLeft)
        self.view.addSubview(labelCenter)
        self.view.addSubview(labelRight)
    }
    
    func getLabelColor(position: Int) -> UIColor {
        var color : UIColor
        
        switch ((Double(position) - Double(positionInit)) / Double(positionRow)).truncatingRemainder(dividingBy: 3) {
            case 1:
                color = UIColor.white
            case 2:
                color = UIColor.red
            default:
                color = UIColor.green
        }
        
        return color
    }
    
    func getTextAlignment(position: Int) -> NSTextAlignment {
        var alignment : NSTextAlignment
        
        switch ((Double(position) - Double(positionInit)) / Double(positionRow)).truncatingRemainder(dividingBy: 2) {
        case 1:
            alignment = .right
        default:
            alignment = .left
        }
        
        return alignment
    }
}

