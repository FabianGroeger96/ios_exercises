//
//  PersonData.swift
//  SwiftProgrammers
//
//  Created by Fabian Gröger on 18.09.18.
//  Copyright © 2018 Fabian Gröger HSLU. All rights reserved.
//

import Foundation

class PersonData {
    var firstName : String
    var lastName : String
    var plz : Int
    
    init(firstName: String, lastName: String, plz: Int){
        self.firstName = firstName
        self.lastName = lastName
        self.plz = plz
    }
}
