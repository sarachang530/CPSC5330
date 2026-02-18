//
//  DetailViewController.swift
//  Festivals
//
//  Created by Sara Chang on 2026-02-18.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedFestival: Festival?
    
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var attendeesLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var specialLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let festival = selectedFestival {
            nameLable.text = festival.name
            locationLabel.text = festival.location
            datesLabel.text = "Dates: \(festival.dates)"
            attendeesLabel.text = "Attendees: \(festival.attendees)"
            priceLabel.text = "GA Price: $\(festival.price)"
            specialLabel.text = "Why is it special?\n \(festival.special)"
        }
        
        
        

    }
}
