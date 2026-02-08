//
//  ViewController.swift
//  MyAdventure
//
//  Created by Sara Chang on 2026-02-07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    
    var adventureLogic = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func buttonSubmitted(_ sender: UIButton) {
        if adventureLogic.isHomeFound() {
            if sender == buttonOne {
                // restart
                adventureLogic.restart()
                
                buttonOne.isEnabled = true
                buttonTwo.isEnabled = true
                
                // delay timer
                Timer.scheduledTimer(
                    timeInterval: 0.1,
                    target: self,
                    selector: #selector(updateUI),
                    userInfo: nil,
                    repeats: false
                )
            } else {
                    // finished
                    storyLabel.text = adventureLogic.getStoryText() + "\n\nPress Restart to Play Again."
                    buttonOne.isEnabled = false
                    buttonTwo.isEnabled = false
                }
                return
            }
        // next choice
        if sender ==  buttonOne {
            adventureLogic.userResponse(0)
        } else {
            adventureLogic.userResponse(1)
        }
        
        Timer.scheduledTimer(
            timeInterval: 0.1,
            target: self,
            selector: #selector(updateUI),
            userInfo: nil,
            repeats: false
        )
    }
    @objc func updateUI() {
        storyLabel.text = adventureLogic.getStoryText()
        
        buttonOne.setTitle(adventureLogic.getNextQuestion(0), for: .normal)
        buttonTwo.setTitle(adventureLogic.getNextQuestion(1), for: .normal)
        
//        buttonOne.backgroundColor = UIColor.clear
//        buttonTwo.backgroundColor = UIColor.clear
    }
}
