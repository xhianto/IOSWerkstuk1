//
//  MapPositiesVC.swift
//  Werkstuk1
//
//  Created by student on 21/05/2021.
//

import UIKit
import CoreLocation
import MapKit

class MapPositiesVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.myMapView.removeAnnotations(self.myMapView.annotations)
        for centrum in LijstCentrum.shared.lijst {
            let annotation = MKPointAnnotation()
            annotation.coordinate = centrum.coordinate
            self.myMapView.addAnnotation(annotation)
            self.myMapView.selectAnnotation(annotation, animated: true)
        }
    }

}
