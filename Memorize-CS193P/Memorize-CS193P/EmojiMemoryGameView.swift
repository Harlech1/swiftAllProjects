//
//  EmojiMemoryGameView.swift
//  Memorize-CS193P
//
//  Created by Turker Kizilcik on 23.08.2023.
//

import SwiftUI

/*
let emojisForHalloween = ["👻","🎃","🕷️","😈","💀","❄️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
let emojisForWinter = ["🌬️","🏔️","🌂","☔","❄️","⛄","🌁","🌲","🎿","🏂","🥶","🧣"]
let emojisForSummer = ["🐚","🏊","👡","😎","🌻","🏝️","🕶️","👕","🌴","☀️","👙","🌞"]
*/


struct EmojiMemoryGameView: View {
    
    var viewModel : EmojiMemoryGame
    
    let emojis: Array<String> = ["👻","🎃","🕷️","😈","💀","❄️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
    
    var body: some View {
            ScrollView {
                cards
            }
            .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                .aspectRatio(2/3,contentMode: .fit)
            }
        }.foregroundColor(.orange)
    }
    
}

struct CardView : View {
    let content: String
    @State var isFaceUp = true
     
    var body : some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content)
                    .font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }.onTapGesture() {
            isFaceUp.toggle()
        }
    }
}


















struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
    }
}

