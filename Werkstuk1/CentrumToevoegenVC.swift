//
//  CentrumToevoegenVC.swift
//  Werkstuk1
//
//  Created by student on 21/05/2021.
//

import UIKit
import MapKit
import CoreLocation

class CentrumToevoegenVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var InputNaam: UITextField!
    @IBOutlet weak var InputStraat: UITextField!
    @IBOutlet weak var InputHuisnummer: UITextField!
    @IBOutlet weak var InputPostcode: UITextField!
    @IBOutlet weak var InputGemeente: UITextField!
    @IBOutlet weak var InputTelefoonnummer: UITextField!
    @IBOutlet weak var ButtonSave: UIBarButtonItem!
    @IBOutlet weak var LabelWaarschuwing: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        InputNaam.layer.borderColor = UIColor.red.cgColor
        InputStraat.layer.borderColor = UIColor.red.cgColor
        InputHuisnummer.layer.borderColor = UIColor.red.cgColor
        InputPostcode.layer.borderColor = UIColor.red.cgColor
        InputGemeente.layer.borderColor = UIColor.red.cgColor
        InputTelefoonnummer.layer.borderColor = UIColor.red.cgColor
    }
    
    @IBAction func Action(_ sender: Any) {
        if AllesIngevuld() {
            let vCentrum = VaccinatieCentrum()
            vCentrum.title = InputNaam.text
            vCentrum.image = "Hospital"
            vCentrum.address.street = InputStraat.text!
            vCentrum.address.number = InputHuisnummer.text!
            vCentrum.address.postalCode = InputPostcode.text!
            vCentrum.address.city = InputGemeente.text!
            vCentrum.phone = InputTelefoonnummer.text!
            
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString("\(InputStraat.text!) \(InputHuisnummer.text!) \(InputGemeente.text!) \(InputPostcode.text!)") {
                placemarks, error in
                let placemark = placemarks?.first
                let lat = placemark?.location?.coordinate.latitude
                let lon = placemark?.location?.coordinate.longitude
                vCentrum.coordinate = CLLocationCoordinate2D(latitude: lat ?? 0, longitude: lon ?? 0)
            }
            //vCentrum.coordinate = CLLocationCoordinate2D(latitude: 50.84324049747469, longitude: 4.332446384072508)
            LijstCentrum.shared.lijst.append(vCentrum)
            self.navigationController?.popViewController(animated: true)
        }
        else {
            LabelWaarschuwing.alpha = 1
        }
    }
    
    func AllesIngevuld() -> Bool {
        var ingevuld = true
        InputNaam.layer.borderWidth = 0
        InputStraat.layer.borderWidth = 0
        InputHuisnummer.layer.borderWidth = 0
        InputPostcode.layer.borderWidth = 0
        InputGemeente.layer.borderWidth = 0
        InputTelefoonnummer.layer.borderWidth = 0
        LabelWaarschuwing.alpha = 0
        if InputNaam.text == "" {
            InputNaam.layer.borderWidth = 1
            ingevuld = false
        }
        if InputStraat.text == "" {
            InputStraat.layer.borderWidth = 1
            ingevuld = false
        }
        if InputHuisnummer.text == "" {
            InputHuisnummer.layer.borderWidth = 1
            ingevuld = false
        }
        if InputPostcode.text == "" {
            InputPostcode.layer.borderWidth = 1
            ingevuld = false
        }
        if InputGemeente.text == "" {
            InputGemeente.layer.borderWidth = 1
            ingevuld = false
        }
        if InputTelefoonnummer.text == "" {
            InputTelefoonnummer.layer.borderWidth = 1
            ingevuld = false
        }
        return ingevuld
    }
    
}

