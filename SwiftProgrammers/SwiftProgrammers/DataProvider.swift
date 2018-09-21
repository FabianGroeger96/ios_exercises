//
//  DataProvider.swift
//  SwiftProgrammers
//
//  Created by Fabian Gröger on 18.09.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import Foundation

class DataProvider {
    
    static let sharedInstance = DataProvider()
    
    var memberNames = [String]()
    var memberPersons = [PersonData]()
    
    init() {
        self.memberNames = [
            "Peter",
            "Michaela",
            "Stefan",
            "Jason",
            "Patracia",
            "Thomas",
            "Daniela",
            "Beat",
            "Sandra"
        ]
        
        self.memberPersons = [
            PersonData(firstName: "Peter", lastName: "Müller", plz: 8000),
            PersonData(firstName: "Martin", lastName: "Walser", plz: 2345),
            PersonData(firstName: "Quentin", lastName: "Trantino", plz: 3456),
            PersonData(firstName: "Hans", lastName: "Stone", plz: 4567),
            PersonData(firstName: "Otto", lastName: "Lotto", plz: 5678),
            PersonData(firstName: "Dave", lastName: "Grohl", plz: 6789),
            PersonData(firstName: "Johanna", lastName: "Obama", plz: 7890),
            PersonData(firstName: "Stefan", lastName: "Test", plz: 8901),
            PersonData(firstName: "Petra", lastName: "Müll", plz: 1234)
        ]
    }
}
