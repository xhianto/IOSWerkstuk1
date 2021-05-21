//
//  Adres.swift
//  Werkstuk1
//
//  Created by student on 21/05/2021.
//

import UIKit

class Address {
    var street: String
    var number: String
    var postalCode: String
    var city: String
    
    init() {
        street = ""
        number = ""
        postalCode = ""
        city = ""
    }
    
    init(street: String, number: String, postalCode: String, city: String) {
        self.street = street
        self.number = number
        self.postalCode = postalCode
        self.city = city
    }
    		
}
