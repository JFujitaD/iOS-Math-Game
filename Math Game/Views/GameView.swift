//
//  GameView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var dataManager: DataManager
    let gameIndex: Int
    
    @State var score: Int = 0
    @State var answer: Int = 0
    @State var answerField = "0"
    @State var num1 = "_"
    @State var num2 = "_"
    @State var buttonDisabled = false
    
    var body: some View {
        VStack {
            Text(dataManager.games[gameIndex].name).font(.largeTitle)
            Spacer()
            Divider()
            Text("Score: \(score)").font(.title)
            HStack{
                Group{
                    Spacer()
                    Text(num1)
                    Spacer()
                    Text(dataManager.games[gameIndex].type.rawValue)
                    Spacer()
                    Text(num2)
                    Spacer()
                    Text("=")
                    Spacer()
                }.font(.title)
                AnswerView(dataManager: dataManager, gameIndex: gameIndex, num1: $num1, num2: $num2, answerField: $answerField, answer: $answer, score: $score)
            }
            .padding(.horizontal)
            Spacer()
            Button(action: {
                buttonDisabled = true
                let (int1, int2) = dataManager.games[gameIndex].getRandomNumbers()
                num1 = String(int1)
                num2 = String(int2)
                answer = dataManager.games[gameIndex].computeAnswer(n1: int1, n2: int2)
            }, label: {
                Text("Start Game")
            }).disabled(buttonDisabled)
            Divider()
            Spacer()
        }
    }
}

struct AnswerView: View {
    @ObservedObject var dataManager: DataManager
    let gameIndex: Int
    @State var questionsLeft = 10
    @State var isGameOver = false
    
    @Binding var num1: String
    @Binding var num2: String
    @Binding var answerField: String
    @Binding var answer: Int
    @Binding var score: Int
    
    var body: some View {
        Group{
            TextField("", text: $answerField)
                .frame(width: 60.0)
                .keyboardType(/*@START_MENU_TOKEN@*/.numberPad/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .font(.title)
                .onChange(of: answerField, perform: { value in
                    // If the answer is corect
                    if Int(answerField) == answer {
                        questionsLeft -= 1
                        // If there are no questions left
                        if questionsLeft == 0 {
                            score += 1
                            isGameOver = true
                            dataManager.scores.append(HighScore(winnerName: "Julian", score: score))
                            num1 = "_"
                            num2 = "_"
                            answer = 0
                        }
                        // If the game is already over
                        else if questionsLeft < 0 {
                            
                        }
                        // Regular correct answer
                        else {
                            score += 1
                            let (int1, int2) = dataManager.games[gameIndex].getRandomNumbers()
                            num1 = String(int1)
                            num2 = String(int2)
                            answer = dataManager.games[gameIndex].computeAnswer(n1: int1, n2: int2)
                            answerField = ""
                        }
                    }
                })
                .background(Color(.sRGB, red: 0, green: 1, blue: 1, opacity: 0.25))
                .alert(isPresented: $isGameOver, content: {
                    Alert(title: Text("Game Over!"), message: Text("Score: \(score)"), dismissButton: .cancel())
                })
            Spacer()
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static let game = Game(name: "Division", type: .DIV)
    static var dataManager = DataManager()
    
    static var previews: some View {
        GameView(dataManager: dataManager, gameIndex: 3)
    }
}
