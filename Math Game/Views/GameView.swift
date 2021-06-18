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
                let (int1, int2) = game.getRandomNumbers()
                num1 = String(int1)
                num2 = String(int2)
                answer = game.computeAnswer(n1: int1, n2: int2)
                print(answer)
            }, label: {
                Text("Start Game")
            }).disabled(buttonDisabled)
            Divider()
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static let game: Game = Game(name: "Division", type: .DIV)
    
    static var previews: some View {
        GameView(game: game)
    }
}
