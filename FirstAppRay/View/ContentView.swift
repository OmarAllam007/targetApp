//  Created by Omar Khaled on 26/01/2022.


import SwiftUI

struct ContentView: View {
    
    @State private var isAlertVisible = false
    @State private var sliderValue:Double = 50.0
    @State private var game:Game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack{
                
                InstructionsView(game: $game)
                
                if isAlertVisible {
                    AlertView(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else{
                    SliderView(sliderValue: $sliderValue)
                        .transition(.scale)
                    HitMeButton(isAlertVisible: $isAlertVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
                
                
                

            }
        }
        
    }
}


struct InstructionsView :View {
    @Binding var game:Game
    var body: some View {
        VStack{
            CustomTextView(text: "🎯🎯🎯 \nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                .padding(.leading,20)
                .padding(.trailing,20)
            
            BigTextView(text: String(game.target))
        }
    }
}

struct SliderTextLabel :View {
    var text:String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35)
    }
}

struct SliderView :View {
    @Binding var sliderValue:Double

    var body: some View {
        HStack{
            SliderTextLabel(text: "1")
            Slider(value: self.$sliderValue, in: 1.0...100.0)
            SliderTextLabel(text: "100")
        }.padding()
    }
}


struct HitMeButton :View {
    @Binding  var isAlertVisible:Bool
    @Binding  var sliderValue:Double
    @Binding  var game:Game

    var body: some View {
        
        Button(action: {
            withAnimation{
                self.isAlertVisible = true
            }
            
        }){
            Text("Hit Me".uppercased())
                .font(.title3)
                .fontWeight(.black)
                .padding()
        }
        .background(
            ZStack{
                Color("ButtonColor")
                LinearGradient(colors: [.white.opacity(0.3), .clear,], startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(.white)
        .cornerRadius(21.0)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.white,lineWidth: 2.0)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 300))
    }
}
