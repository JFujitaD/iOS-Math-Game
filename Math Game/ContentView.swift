//
//  ContentView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("+ - Choose A Game / *").font(.title)
                    Spacer()
                    Group{
                        Group{
                            Divider()
                            NavigationLink(
                                destination: GameView(dataManager: dataManager, gameIndex: 0),
                                label: {
                                    Text("Addition")
                                })
                            Divider()
                            NavigationLink(
                                destination: GameView(dataManager: dataManager, gameIndex: 1),
                                label: {
                                    Text("Subtraction")
                                })
                            Divider()
                            NavigationLink(
                                destination: GameView(dataManager: dataManager, gameIndex: 2),
                                label: {
                                    Text("Multiplication")
                                })
                            Divider()
                            NavigationLink(
                                destination: GameView(dataManager: dataManager, gameIndex: 3),
                                label: {
                                    Text("Division")
                                })
                        }
                        Group{
                            Divider()
                            NavigationLink(destination: HighScoreView(dataManager: dataManager)) {
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
