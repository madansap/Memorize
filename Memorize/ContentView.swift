//
//  ContentView.swift
//  Memorize
//
//  Created by Madan Sapkota on 02/07/2024.
//

import SwiftUI

struct ContentView: View {  // Behaves like a view.
    var body: some View {   // Run this code and return Any View
        
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
            CardView()
            
        }
            .foregroundColor(.orange)
            .padding()
        }
    }

struct CardView : View {
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {            // Computed Property - It's not stored somewhere it's computed.
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text("💎")
                    .font(.largeTitle)
            }
            else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



// Creating instances of structs
// Named Parameters
// Parameter Defaults
// So Vstack is also same as image or text



#Preview {
    ContentView()
}
