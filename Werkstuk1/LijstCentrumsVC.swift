//
//  ViewController.swift
//  Werkstuk1
//
//  Created by student on 21/05/2021.
//

import UIKit
import MapKit

class LijstCentrumsVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //LijstCentrum.shared.lijst
        let address5 = Address(street: "Pachecolaan", number: "42", postalCode: "1000", city: "Brussel")
        let centrum5 = VaccinatieCentrum(title: "Test- en vaccinatiecentrum", image: "Brussel", address: address5, coordinate: CLLocationCoordinate2D(latitude: 50.85324049747469, longitude: 4.362446384072508), phone: "")
        
        LijstCentrum.shared.lijst.append(centrum5)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LijstCentrum.shared.lijst.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CentrumCell", for: indexPath)
        cell.textLabel?.text = LijstCentrum.shared.lijst[indexPath.row].title
        cell.detailTextLabel?.text = LijstCentrum.shared.lijst[indexPath.row].address.city
        
        return cell
    }
}

