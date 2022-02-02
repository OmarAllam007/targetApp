//
//  CustomTextView.swift
//  FirstAppRay
//
//  Created by Omar Khaled on 29/01/2022.
//

import SwiftUI

struct CustomTextView: View {
    var text:String
    
    var body: some View {
        Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}


struct BigTextView: View {
    var text:String
    
    var body: some View {
        Text(String(text))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
    }
}

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextView(text: "Test Text")
    }
}
