//
//  ViewController.swift
//  MoodTracker
//
//  Created by Sara Chang on 2026-01-31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var moodSlider: UISlider!
    @IBOutlet weak var savedLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        savedLabel.text = "How do you feel?"
    }

    @IBAction func moodSlider(_ sender: UISlider) {
        let val = (Int(sender.value));
        print(val);
        let moodInfo = isMood(for: val)
        
        moodLabel.text = "Feeling: \(moodInfo.mood) \(moodInfo.emoji)"
    }
 
    @IBAction func saveMood(_ sender: UIButton) {
        let sliderVal = Int(moodSlider.value)
        let date = datePicker.date
        let moodInfo = isMood(for: sliderVal)
        let dateVal = formattedDate(date)
        
        
        savedLabel.text = "On \(dateVal), you felt \(moodInfo.emoji)"
    }
    
    
    func isMood(for value: Int) -> (mood: String, emoji: String) {

        if value >= 0 && value <= 20 {
            return (mood: "Very Sad", emoji: "😢")
        } else if value <= 40 {
            return (mood: "Sad", emoji: "☹️")
        } else if value <= 60 {
            return (mood: "Neutral", emoji: "😐")
        } else if value <= 80 {
            return (mood: "Happy", emoji: "🙂")
        } else {
            return (mood: "Very Happy", emoji: "🥰")
        }
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter.string(from: date)
    }
}

