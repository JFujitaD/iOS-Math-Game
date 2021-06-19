//
//  HighScoreView.swift
//  Math Game
//
//  Created by Julian Dean on 6/18/21.
//

import SwiftUI

struct HighScoreView: View {
    @ObservedObject var dataManager: DataManager
    
    var body: some View {
        VStack{
            Text("High Scores").font(.largeTitle)
            List {
                ForEach(dataManager.scores, content: {
                    hs in
                    Text("\(hs.winnerName) - \(hs.score)pts.")
                })
            }.font(.title)
        }
    }
}

struct HighScoreView_Previews: PreviewProvider {
    static var dataManager = DataManager()
    static var previews: some View {
        HighScoreView(dataManager: dataManager)
    }
}
