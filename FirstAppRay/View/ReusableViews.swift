//
//  ReusableViews.swift
//  FirstAppRay
//
//  Created by Omar Khaled on 01/02/2022.
//

import SwiftUI

struct ReusableViews: View {
    var body: some View {
        VStack{
            RoundedTextView(text: "1")
            ScoreText(score: 10)
            DateText(date: Date())
            BigBoldText(text:"LeaderShip")
        }
        
    }
}

struct RoundedTextView: View {
    var text:String
    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("LeaderBorderRowColor"), lineWidth: Constants.General.strokeWidth)
            )
            
    }
}

struct ScoreText:View {
    var score:Int
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}



struct DateText:View {
    var date:Date
    var body: some View {
        Text(date , style: .time)
            .bold()
            .kerning(-2.0)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct BigBoldText:View {
    var text:String
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
            
    }
}

struct ReusableViews_Previews: PreviewProvider {
    static var previews: some View {
        ReusableViews()
    }
}
