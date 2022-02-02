//
//  BackgroundView.swift
//  FirstAppRay
//
//  Created by Omar Khaled on 29/01/2022.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game:Game
    
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
            
        }
        .padding()
        .background(RingsView())
        
    }
}

struct RingsView: View{
//    @Environment
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View{
    
        ZStack{
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            let opacity = colorScheme == .dark ? 0.1 : 0.3
            ForEach(1..<6){ ring in
                 let ring = CGFloat( ring * 100)
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(
                    RadialGradient(colors: [
                        Color("RingColor").opacity(opacity),
                        Color("RingColor").opacity(0)
                    ], center: .center, startRadius: 100, endRadius: 300)
                    
                    )
                    .frame(width: ring, height: ring)
            }
        }
        
    }
}

struct TopView: View {
    @State private var isShowingLeaderboard = false
    @Binding var game:Game
    
    var body: some View {
        HStack(spacing:20.0){
            Button(action:{
                game.restart()
            }){
                StrokedViewWithIcon(systemName: "arrow.counterclockwise")
            }

            Spacer()
            Button(action: {
                isShowingLeaderboard = true
            }) {
                FilledViewWithIcon(systemName: "list.dash")
            }.sheet(isPresented: $isShowingLeaderboard, onDismiss: {}, content: {
                LeadershipView(isShowingLeaderboard:$isShowingLeaderboard, game:$game)
            })
            
        }
    }
}


struct BottomView: View {
    @Binding var game:Game
    var body: some View {
        HStack(spacing:20.0){
            NumberView(label: "Score",number: String(game.score))
            Spacer()
            NumberView(label: "Round", number: String(game.round))
        }
    }
}

struct NumberView: View {
    var label:String
    var number:String
    var body: some View {
        VStack{
            Text(label)
                .bold()
                .foregroundColor(Color("TextColor"))
                .kerning(1.5)
                .font(.caption)
            
            Text(number)
                .kerning(-1.0)
                .bold()
                .font(.title3)
                .frame(width: 68, height: 68)
                .foregroundColor(Color("TextColor"))
                .overlay(
                    RoundedRectangle(cornerRadius: 21)
                        .stroke(lineWidth: 2.0)
                        .foregroundColor(Color("ColorStrokeButton"))
                )
        }
        
        
    }
}


struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
        BackgroundView(game: .constant(Game()))
            .preferredColorScheme(.dark)
    }
}
