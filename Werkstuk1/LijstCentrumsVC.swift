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
        self.tableView.reloadData()
        // Do any additional setup after loading the view.
        //LijstCentrum.shared.lijst
        //let address5 = Address(street: "Pachecolaan", number: "42", postalCode: "1000", city: "Tester")
        //let centrum5 = VaccinatieCentrum(title: "Tester", image: "Hospital", address: address5, coordinate: CLLocationCoordinate2D(latitude: 50.84324049747469, longitude: 4.332446384072508), phone: "")
        
        //LijstCentrum.shared.lijst.append(centrum5)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        LijstCentrum.shared.lijst.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CentrumCell", for: indexPath)
        cell.textLabel?.text = LijstCentrum.shared.lijst[indexPath.row].title
        cell.detailTextLabel?.text = LijstCentrum.shared.lijst[indexPath.row].address.city
        cell.imageView?.image = UIImage(named: LijstCentrum.shared.lijst[indexPath.row].image)
        cell.imageView?.contentMode = .scaleToFill
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    /*
     Voor delete: http://www.youtube.com/watch?v=5QdAPoFYBqM
     */
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            LijstCentrum.shared.lijst.remove(at: indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CentrumDetailVC {
            let cDetailVC = segue.destination as? CentrumDetailVC
            let indexPath = self.tableView.indexPathForSelectedRow
            cDetailVC?.centrum = LijstCentrum.shared.lijst[(indexPath?.row)!]
        }
    }
}

