//
//  LijstCentrums.swift
//  Werkstuk1
//
//  Created by student on 21/05/2021.
//

import UIKit
import MapKit

final class LijstCentrum {
    
    var lijst = [VaccinatieCentrum]()
    
    static let shared = LijstCentrum()
    
    private init() {
        let address1 = Address(street: "Theo Verbeecklaan", number: "2", postalCode: "1070", city: "Anderlecht")
        let address2 = Address(street: "Gentsesteenweg", number: "696", postalCode: "1080", city: "Molenbeek")
        let address3 = Address(street: "Jupiterlaan", number: "201", postalCode: "1190", city: "Vorst")
        let address4 = Address(street: "Pachecolaan", number: "42", postalCode: "1000", city: "Brussel")
        
        let centrum1 = VaccinatieCentrum(title: "RSCA", image: "Anderlecht", address: address1, coordinate: CLLocationCoordinate2D(latitude: 50.83491506947994, longitude: 4.2987749264001245), phone: "")
        let centrum2 = VaccinatieCentrum(title: "Molenbeek", image: "Molenbeek", address: address2, coordinate: CLLocationCoordinate2D(latitude: 50.86004345193222, longitude: 4.3074399398939205), phone: "")
        let centrum3 = VaccinatieCentrum(title: "Test- en vaccinatiecentrum Albert", image: "Vorst", address: address3, coordinate: CLLocationCoordinate2D(latitude: 50.820939949404824, longitude: 4.34079373989214), phone: "")
        let centrum4 = VaccinatieCentrum(title: "Test- en vaccinatiecentrum", image: "Brussel", address: address4, coordinate: CLLocationCoordinate2D(latitude: 50.85324049747469, longitude: 4.362446384072508), phone: "")
        
        lijst.append(centrum1)
        lijst.append(centrum2)
        lijst.append(centrum3)
        lijst.append(centrum4)
    }
}
