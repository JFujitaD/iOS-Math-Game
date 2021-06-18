//
//  ContentView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    private var games = Games().list
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("+ - Choose A Game / *").font(.title)
                    Spacer()
                    Group{
                        Group{
                            Divider()
                            NavigationLink(destination: GameView(game: games[0])) {
                                Text("Addition")
                            }
                            Divider()
                            NavigationLink(destination: GameView(game: games[1])) {
                                Text("Subtraction")
                            }
                            Divider()
                            NavigationLink(destination: GameView(game: games[2])) {
                                Text("Multiplication")
                            }
                            Divider()
                            NavigationLink(destination: GameView(game: games[3])) {
                                Text("Division")
                            }
                        }
                        Group{
                            Divider()
                            NavigationLink(destination: HighScoreView()) {
                                Text("High Scores").foregroundColor(.green)
                            }
                            Divider()
                        }
                    }
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.red)
                    Spacer()
                }.navigationTitle("Math Game Home")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
