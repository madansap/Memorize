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
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
            .foregroundColor(.orange)
            .padding()
        }
    }

struct CardView : View {
    var isFaceUp: Bool = false
    
    var body: some View {
        ZStack {            // Computed Property - It's not stored somewhere it's computed.
            
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.white)
                
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("💎")
                    .font(.largeTitle)
            }
            else {
                RoundedRectangle(cornerRadius: 12)
            }
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
