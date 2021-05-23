//
//  MapPositiesVC.swift
//  Werkstuk1
//  50.84242484021892, 4.323149876105084
//  Created by student on 21/05/2021.
//

import UIKit
import CoreLocation
import MapKit

class MapPositiesVC: UIViewController, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    var selectedAnnotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.myMapView.removeAnnotations(self.myMapView.annotations)
        for centrum in LijstCentrum.shared.lijst {
            let annotation = MKPointAnnotation()
            annotation.coordinate = centrum.coordinate
            annotation.title = centrum.title
            annotation.subtitle = centrum.image
            //annotation.observationInfo = centrum.image
            //annotation.ImagaName = centrum.image
            
            self.myMapView.addAnnotation(annotation)
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        self.selectedAnnotation = (view.annotation as? MKPointAnnotation)!
        view.canShowCallout = true
        let imView = UIImageView(image: UIImage(named: selectedAnnotation.subtitle!))
        imView.frame = CGRect(x: imView.frame.origin.x, y: imView.frame.origin.y, width: 50, height:50)
        view.leftCalloutAccessoryView = imView
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let centre = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: centre, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
        
        mapView.setRegion(region, animated: true)
    }
}
