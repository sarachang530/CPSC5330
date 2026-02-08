//
//  AdventureLogic.swift
//  MyAdventure
//
//  Created by Sara Chang on 2026-02-07.
//

import Foundation


struct AdventureLogic {
        var questionIndex : Int = 0
    
    let question : [AdventureStory] = [
        
        // Start - Choice: 0
        AdventureStory(
            storyText: "You wandered a little too far and suddenly everything looks unfamiliar. You stop and take a breath. Which way should we go?",
            choices: [
                Choice(choiceText: "Follow a yummy smell", nextIdx: 1),
                Choice(choiceText: "Chase the jingling bells!", nextIdx: 2)
            ],
            isFound: false
        ),
        
        // Smell path - Choice: 1
        AdventureStory(
            storyText: "The smell is warm and familiar. It reminds you of your home, but it leads toward a busy road. You hesitate.",
            choices: [
                Choice(choiceText: "Cross carefully with a crosswalk", nextIdx: 3),
                Choice(choiceText: "Turn back and try another way", nextIdx: 2)
            ],
            isFound: false
        ),
        
        // Sound path - Choice: 2
        AdventureStory(
            storyText: "The sound isn’t far now. It could be someone nearby… or just noise from the park. You’re not sure, but you have to choose.",
            choices: [
                Choice(choiceText: "Approach the friendly dogs at the park", nextIdx: 3),
                Choice(choiceText: "Doesn't sound safe, time to hide under the bench", nextIdx: 4)
            ],
            isFound: false
        ),
        
        // Successful ending - Choice: 3
        AdventureStory(
            storyText: "The path feels right! You see a familiar face. You've found your human and its finally time to go home!",
            choices: [
                Choice(choiceText: "YAY!, play again!", nextIdx: 0),
                Choice(choiceText: "End Game", nextIdx: 3)
            ],
            isFound: true
        ),
        
        // Unsuccessful ending - Choice: 4
        AdventureStory(
            storyText: "You wait for a long time. You’re safe for now… but you’re still lost.",
            choices: [
                Choice(choiceText: "Restart, try again", nextIdx: 0),
                Choice(choiceText: "Game Over", nextIdx: 4)
            ],
            isFound: true
        )
    ]

    mutating func userResponse(_ choiceIdx: Int) {
        questionIndex = question[questionIndex].choices[choiceIdx].nextIdx
    }
    
    mutating func restart() {
        questionIndex = 0
    }
    func getStoryText() -> String {
        return question[questionIndex].storyText
    }
    
    func getNextQuestion(_ idx: Int) -> String {
        return question[questionIndex].choices[idx].choiceText
    }
    
    func isHomeFound() -> Bool {
        return question[questionIndex].isFound
    }
}

