//
//  AdventureStory.swift
//  MyAdventure
//
//  Created by Sara Chang on 2026-02-07.
//

import Foundation

struct Choice {
    let choiceText: String
    let nextIdx: Int
}
struct AdventureStory {
    let storyText: String
    let choices: [Choice]
    let isFound: Bool
    
}





