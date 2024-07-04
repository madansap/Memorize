//
//  ContentView.swift
//  Memorize
//
//  Created by Madan Sapkota on 02/07/2024.
//

import SwiftUI

struct ContentView: View {
    
    let emojis = ["💎","🌀","❤️","🍪","❇️","🔋","🏴","⌨️"]
    @State var cardCount : Int = 5
    
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
                Spacer()
                cardCountAdjusters
            }
            .padding()
        }
    
    
    
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
    }
    
    func cardCountAdjuster (by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    
    var cardCountAdjusters : some View{
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
        
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "plus.square")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.square")
    }
    
    struct CardView : View {
        let content: String
        @State var isFaceUp = true
        
        var body: some View {
            ZStack {            // Computed Property - It's not stored somewhere it's computed.
                let base = RoundedRectangle(cornerRadius: 12)
                Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
            }
            
            .onTapGesture {
                isFaceUp.toggle()
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
