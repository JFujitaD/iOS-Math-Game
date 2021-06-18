//
//  HighScore.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import Foundation

struct HighScore: Identifiable{
    var id = UUID()
    let winnerName: String
    let score: Int
    
    init(winnerName: String, score: Int) {
        self.winnerName = winnerName
        self.score = score
    }
}
