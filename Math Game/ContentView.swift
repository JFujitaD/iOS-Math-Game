//
//  ContentView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                VStack {
                    Text("+ - Choose A Game / *").font(.title)
                    Spacer()
                    Group{
                        Group{
                            Divider()
                            NavigationLink(destination: Text("Test")) {
                                Text("Addition")
                            }
                            Divider()
                            NavigationLink(destination: Text("Test")) {
                                Text("Subtraction")
                            }
                            Divider()
                            NavigationLink(destination: Text("Test")) {
                                Text("Multiplication")
                            }
                            Divider()
                            NavigationLink(destination: Text("Test")) {
                                Text("Division")
                            }
                        }
                        Group{
                            Divider()
                            NavigationLink(destination: Text("Test")) {
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
