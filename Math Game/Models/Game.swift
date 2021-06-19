//
//  Game.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

struct Game {
    let name: String
    let type: GameType
    
    func computeAnswer(n1: Int, n2: Int) -> Int {
        switch type {
        case .ADD:
            return n1 + n2
        case .SUB:
            return n1 - n2
        case .MUL:
            return n1 * n2
        case .DIV:
            return n1 / n2
        }
    }
    
    func getRandomNumbers() -> (Int, Int) {
        var r1: Int
        var r2: Int
        
        switch type {
        case .ADD:
            r1 = Int.random(in: 1...30)
            r2 = Int.random(in: 1...30)
        case .SUB:
            r1 = Int.random(in: 1...20)
            r2 = Int.random(in: 1...20)
            
            if r1 < r2 {
                let r1Temp = r1
                r1 = r2
                r2 = r1Temp
            }
        case .MUL:
            r1 = Int.random(in: 2...12)
            r2 = Int.random(in: 2...12)
        case .DIV:
            r1 = Int.random(in: 1...50)
            r2 = Int.random(in: 1...50)
            
            if r1 < r2 {
                let r1Temp = r1
                r1 = r2
                r2 = r1Temp
            }
            
            while r1 % r2 != 0 {
                r2 -= 1
            }
        }
        
        return (r1, r2)
    }
}

enum GameType: String{
    case ADD = "+"
    case SUB = "-"
    case MUL = "X"
    case DIV = "/"
}
