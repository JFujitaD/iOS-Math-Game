//
//  Game.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

struct Game {
    let name: String
    let type: GameType
    
}

enum GameType: String{
    case ADD = "+"
    case SUB = "-"
    case MUL = "X"
    case DIV = "/"
}
