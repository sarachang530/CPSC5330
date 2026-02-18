//
//  ViewController.swift
//  Festivals
//
//  Created by Sara Chang on 2026-02-18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var festivals: [Festival] = [
        Festival(
            name: "A State of Trance (ASOT)",
            location: "Utrecht, Netherlands",
            dates: "February 20-21, 2026",
            attendees: 40000,
            special: "The world’s biggest trance-only festival, centered around Armin van Buuren’s global ASOT brand.",
            price: 250
        ),
        Festival(
            name: "Creamfields",
            location: "Daresbury, England, UK",
            dates: "August 27–30, 2026",
            attendees: 70000,
            special: "UK’s largest EDM festival featuring huge outdoor stages and massive indoor mega-structures.",
            price: 350
        ),
        Festival(
            name: "Defqon.1",
            location: "Biddinghuizen, Netherlands",
            dates: "June 25–28, 2026",
            attendees: 65000,
            special: "The largest hardstyle festival in the world, famous for its powerful endshows and anthem culture.",
            price: 300
        ),
        Festival(
            name: "Electric Daisy Carnival",
            location: "Las Vegas, Nevada, USA",
            dates: "May 15–17, 2026",
            attendees: 525000,
            special: "Nighttime festival with massive neon stages, fireworks, and carnival rides at Las Vegas Motor Speedway.",
            price: 500
        ),
        Festival(
            name: "Electric Forest",
            location: "Rothbury, Michigan, USA",
            dates: "June 18–21, 2026",
            attendees: 50000,
            special: "Unique forest setting with interactive art installations and immersive camping experience.",
            price: 450
        ),
        Festival(
            name: "Lost Lands",
            location: "Thornville, Ohio, USA",
            dates: "September 18–20, 2026",
            attendees: 40000,
            special: "World’s premier dubstep festival, known for dinosaur themes and heavy bass-focused production.",
            price: 400
        ),
        Festival(
            name: "Snowbombing",
            location: "Mayrhofen, Austria",
            dates: "April 6–11, 2026",
            attendees: 30000,
            special: "Combines skiing in the Alps with EDM events in mountain venues and après-ski parties.",
            price: 450
        ),
        Festival(
            name: "Tomorrowland",
            location: "Boom, Belgium",
            dates: "July 17–19 & July 24–26, 2026",
            attendees: 400000,
            special: "Fairytale-style stage worlds and immersive fantasy themes attracting people from over 200 countries.",
            price: 400
        ),
        Festival(
            name: "Ultra Music Festival",
            location: "Miami, Florida, USA",
            dates: "March 27–29, 2026",
            attendees: 165000,
            special: "Major global EDM season opener held in downtown Miami with iconic live-streamed performances.",
            price: 450
        ),
        Festival(
            name: "Untold Festival",
            location: "Cluj-Napoca, Romania",
            dates: "August 6–9, 2026",
            attendees: 375000,
            special: "Massive European EDM festival featuring huge stadium stages and globally famous DJs.",
            price: 350
        ),
    ]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return festivals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FestivalCell", for: indexPath)
        let festival = festivals[indexPath.row]
        cell.textLabel?.text = festival.name
        cell.detailTextLabel?.text = festival.location
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "showFestivalDetails" {

            if let destination = segue.destination as? DetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {

                destination.selectedFestival = festivals[indexPath.row]

            }
        }
    }


}

