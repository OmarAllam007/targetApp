//
//  RoundedViews.swift
//  FirstAppRay
//
//  Created by Omar Khaled on 29/01/2022.
//

import SwiftUI

struct RoundedViews: View {
    var body: some View {
        VStack{
            
            
            BodyText(text: "You scored 200 points \n 🎉🎉🎉")
            ButtonText(text: "Start New Round")
        }.padding()
        
    }
}

struct BodyText:View {
    var text:String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12)
    }
}


struct ButtonText:View {
    var text:String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth:.infinity)
            .background(
                Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct StrokedViewWithIcon: View {
    var systemName:String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(
                Circle()
                    .strokeBorder(Color("ColorStrokeButton"), lineWidth: 2.0)
            )
    }
}


struct FilledViewWithIcon: View {
    var systemName:String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .background(
                Circle()
                    .fill(Color("ButtonFilledBackgroundColor"))
            )
        
    }
}



struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        RoundedViews()
    }
}
