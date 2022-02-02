//
//  AlertView.swift
//  FirstAppRay
//
//  Created by Omar Khaled on 29/01/2022.
//

import SwiftUI

struct AlertView: View {
    @Binding  var isAlertVisible:Bool
    @Binding  var sliderValue:Double
    @Binding  var game:Game
    
    var body: some View {
        let roundedValue = Int(sliderValue.rounded())
        let points = game.getPoints(value: roundedValue)
        
        VStack{
            CustomTextView(text: "The slider's value is")
            BigTextView(text: "\(roundedValue)")
            
            BodyText(text: "You scored \(points) points \n 🎉🎉🎉")
            Button(action: {
                withAnimation {
                    isAlertVisible = false
                }
                game.startNewRound(points: points)
                
            }) {
                ButtonText(text: "Start New Round")
            }
            
        }
        .padding()
        .frame(maxWidth:300)
        .background(Color("BackgroundColor"))
        .cornerRadius(21.0)
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct AlertView_Previews: PreviewProvider {
    static  var isAlertVisible = Binding.constant(true)
    static  var sliderValue  = Binding.constant(50.0)
    static  var game  = Binding.constant(Game())
    
    static var previews: some View {
        AlertView(isAlertVisible: isAlertVisible, sliderValue: sliderValue, game: game)
    }
}
