//
//  ContentView.swift
//  Memorize
//
//  Created by camillejin on 2022/01/06.
//

import SwiftUI

struct ContentView: View {
    
    // definition of var body: give me a UI that shows what's in the model
    @ObservedObject var viewModel: EmojiMemoryGame
    //when viewModel says something has changed, rebuild the entire body

    var body: some View {
        VStack {
            HStack {
                Button {
                    viewModel.newGame()
                } label: { Text(" New\nGame")}
                Spacer()
                VStack {
                    Text("Memorize!").font(.largeTitle)
                    Text(viewModel.themeName.uppercased())
                }.foregroundColor(viewModel.themeColor())
                Spacer()
                Text("Score: " + String(viewModel.score))

            }
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))] ) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(viewModel.themeColor())
            
        }
        .padding(.horizontal)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card // read-only struct, don't make it var
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20) //let => constant
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                // strokeBorder: when we want the borders inside the shape
                Text(card.content).font(.largeTitle)
            }
            else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
