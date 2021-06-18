//
//  GameView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct GameView: View {
    let game: Game
    
    @State var answer: Int = 0
    @State var answerField = "0"
    @State var num1 = "_"
    @State var num2 = "_"
    @State var buttonDisabled = false
    
    var body: some View {
        VStack {
            Text(game.name).font(.largeTitle)
            Spacer()
            Divider()
            Text("Solve the equation!").font(.title)
            HStack{
                Group{
                    Spacer()
                    Text(num1)
                    Spacer()
                    Text(game.type.rawValue)
                    Spacer()
                    Text(num2)
                    Spacer()
                    Text("=")
                    Spacer()
                }.font(.title)
                Group{
                    TextField("", text: $answerField)
                        .frame(width: 60.0)
                        .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .font(.title)
                    Spacer()
                }
            }
            .padding(.horizontal)
            Spacer()
            Button(action: {
                buttonDisabled = true
                (num1, num2, answer) = chooseRandomNumbers()
            }, label: {
                Text("Start Game")
            }).disabled(buttonDisabled)
            Divider()
            Spacer()
        }
    }
}

func chooseRandomNumbers() -> (r1: String, r2: String, ans: Int){
    let rand1 = Int.random(in: 1...9)
    let rand2 = Int.random(in: 1...9)
    
    return (String(rand1), String(rand2), rand1 + rand2)
}

struct GameView_Previews: PreviewProvider {
    static let game: Game = Game(name: "Addition", type: .ADD)
    
    static var previews: some View {
        GameView(game: game)
    }
}
