//
//  DataManager.swift
//  Math Game
//
//  Created by Julian Dean on 6/19/21.
//

import Foundation

class DataManager: ObservableObject {
    @Published var games = [
        Game(name: "Addition", type: .ADD),
        Game(name: "Subtraction", type: .SUB),
        Game(name: "Multiplication", type: .MUL),
        Game(name: "Division", type: .DIV)
    ]
    @Published var scores: [HighScore] = [
        HighScore(winnerName: "Jerome", score: 225),
        HighScore(winnerName: "Lester", score: 360),
        HighScore(winnerName: "Jen", score: 236),
        HighScore(winnerName: "Paul", score: 125)
    ]
}
