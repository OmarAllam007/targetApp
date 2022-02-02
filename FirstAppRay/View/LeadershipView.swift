//
//  LeadershipView.swift
//  FirstAppRay
//
//  Created by Omar Khaled on 01/02/2022.
//

import SwiftUI

struct LeadershipView: View {
    @Binding var isShowingLeaderboard:Bool
    @Binding var game:Game
    var body: some View {
        
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack(spacing:10) {
                HeaderView(isShowingLeaderboard: $isShowingLeaderboard)
                LabelView()
                
                ScrollView{
                    VStack{
                        ForEach(game.leaderboardEntries.indices){ i in
                            let entry = game.leaderboardEntries[i]
                            RowView(index: i + 1, score: entry.score , date: entry.date)
                        }
                    }
                }
                
            }
        }
    }
}

struct RowView: View {
    var index:Int
    var score:Int
    var date:Date
    
    var body: some View {
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
            DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBorderRowColor"), lineWidth: Constants.General.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:480)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
    }
}

struct HeaderView:View{
    @Binding var isShowingLeaderboard:Bool
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ZStack{
            HStack{
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigTextView(text: "Leaderboard")
                        .padding(.leading)
                    Spacer()
                }
                else{
                    BigTextView(text: "Leaderboard")
                }
                
            }
            
            HStack{
                Spacer()
                Button(action:{
                    isShowingLeaderboard = false
                }){
                    FilledViewWithIcon(systemName: "xmark")
                        .padding(.trailing)
                }
                
                
            }
        }.padding(.top)
        
    }
}

struct LabelView:View{
    var body: some View {
        HStack{
            Spacer()
                .frame(width: Constants.General.roundedViewLength )
            BodyText(text:"Score")
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            //            Spacer()
            BodyText(text:"Time")
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth:480)
        .frame(maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        
    }
}



struct LeadershipView_Previews: PreviewProvider {
    static private var isShowingLeaderboard = Binding.constant(false)
    static private var game = Binding.constant(Game())
    static var previews: some View {
        LeadershipView(isShowingLeaderboard: isShowingLeaderboard, game: game)
        LeadershipView(isShowingLeaderboard: isShowingLeaderboard,game: game)
            .previewLayout(.fixed(width: 568, height: 320))
        LeadershipView(isShowingLeaderboard: isShowingLeaderboard,game: game).preferredColorScheme(.dark)
        LeadershipView(isShowingLeaderboard: isShowingLeaderboard,game: game).preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
