//
//  CentrumDetailVC.swift
//  Werkstuk1
//
//  Created by student on 21/05/2021.
//

import UIKit
import CoreLocation
import MapKit

class CentrumDetailVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var Afbeelding: UIImageView!
    @IBOutlet weak var LabelStraatHuisnummer: UILabel!
    @IBOutlet weak var LabelPostcodeStad: UILabel!
    @IBOutlet weak var LabelTelefoon: UILabel!
    @IBOutlet weak var CentrumMapView: MKMapView!
    
    var centrum = VaccinatieCentrum();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LabelStraatHuisnummer.text = "\(centrum.address.street) \(centrum.address.number)"
        LabelPostcodeStad.text = "\(centrum.address.postalCode) \(centrum.address.city)"
        LabelTelefoon.text = centrum.phone
        Afbeelding.image = UIImage(named: centrum.image)
        let annotation = MKPointAnnotation()
        annotation.coordinate = centrum.coordinate
        self.CentrumMapView.addAnnotation(annotation)
        self.CentrumMapView.selectAnnotation(annotation, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let center = CLLocationCoordinate2D(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005))
        
        mapView.setRegion(region, animated: true)
    }
}

