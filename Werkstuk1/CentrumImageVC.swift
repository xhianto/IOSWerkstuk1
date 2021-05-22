//
//  CentrumImage.swift
//  Werkstuk1
//
//  Created by student on 22/05/2021.
//

import UIKit

class CentrumImageVC: UIViewController {
    
    var image = String()
    @IBOutlet weak var Afbeelding: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Afbeelding.image = UIImage(named: image)
    }
    
}

