//
//  VaccinatieCentrum.swift
//  Werkstuk1
//
//  Created by student on 21/05/2021.
//

import UIKit
import MapKit

class VaccinatieCentrum: NSObject, MKAnnotation {
    var title: String?
    var image: String
    var address = Address()
    var coordinate: CLLocationCoordinate2D
    var phone: String
    
    override init() {
        title = ""
        image = ""
        address = Address()
        coordinate = CLLocationCoordinate2D()
        phone = ""
    }
    
    init(title:String, image: String, address: Address, coordinate: CLLocationCoordinate2D, phone: String) {
        self.title = title
        self.image = image
        self.address = address
        self.coordinate = coordinate
        self.phone = phone
    }
}
