//
//  HighScoreView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct HighScoreView: View {
    @Binding var highScores: [HighScore]
    
    var body: some View {
        VStack{
            Text("High Scores").font(.largeTitle)
            List {
                ForEach(highScores, content: {
                    hs in
                    Text("\(hs.winnerName) - \(hs.score)pts.")
                })
            }.font(.title)
        }
    }
}

struct HighScoreView_Previews: PreviewProvider {
    @State static var highScores = HighScores().list
    static var previews: some View {
        HighScoreView(highScores: $highScores)
    }
}
