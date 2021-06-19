//
//  ContentView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    @State private var games = Games().list
    @State var highScores = HighScores().list
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("+ - Choose A Game / *").font(.title)
                    Spacer()
                    Group{
                        Group{
                            Divider()
                            NavigationLink(destination: GameView(game: games[0], games: $games, highScores: $highScores)) {
                                Text("Addition")
                            }
                            Divider()
                            NavigationLink(destination: GameView(game: games[1], games: $games, highScores: $highScores)) {
                                Text("Subtraction")
                            }
                            Divider()
                            NavigationLink(destination: GameView(game: games[2], games: $games, highScores: $highScores)) {
                                Text("Multiplication")
                            }
                            Divider()
                            NavigationLink(destination: GameView(game: games[3], games: $games, highScores: $highScores)) {
                                Text("Division")
                            }
                        }
                        Group{
                            Divider()
                            NavigationLink(destination: HighScoreView(highScores: $highScores)) {
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
