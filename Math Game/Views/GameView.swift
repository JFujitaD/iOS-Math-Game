//
//  GameView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct GameView: View {
    let game: Game
    @State var answerField = "0"
    @State var num1 = "a"
    @State var num2 = "b"
    
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
            Button(action: {}, label: {
                Text("Start Game")
            })
            Divider()
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static let game: Game = Game(name: "Addition", type: .ADD)
    
    static var previews: some View {
        GameView(game: game)
    }
}
