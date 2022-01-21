//
//  ContentView.swift
//  Memorize
//
//  Created by camillejin on 2022/01/06.
//

import SwiftUI

struct ContentView: View {
    
    let vehicles = ["✈️", "🚗", "🚂", "🚀", "🚁", "🚜", "🚕", "🏎", "🚑", "🚓", "🚒", "⛵️", "🚝", "🛶", "🚌", "🏍", "🛵", "🚠", "🛺", "🚚", "🛻", "🚇", "🛸" , "🚛"]
    var smileys = ["🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛"]
    var weather = ["☀️", "🌤", "🌈", "🌪", "🌦", "🌩", "☔️", "❄️", "💨", "☁️"]
    
    @State var emojis: [String] = []
    @State var emojiCount: Int = 0

    var body: some View {
        
        
        VStack {
            Text("Memorize!").font(.largeTitle)
        
            Spacer()
            
            ScrollView {
                // 'lazy' about accessing the body bars
                LazyVGrid(columns: [GridItem(.adaptive(minimum:65))] ) {
                    // "id: \.self" makes the string itself as an identifier
                    // 0..<6 up to not including 6, 0...<6 up to and including 6
                    
                    ForEach(emojis[0..<emojiCount], id: \.self) {
                        emoji in CardView(content: emoji).aspectRatio(2/3, contentMode: .fit) }
                }
            }
            .foregroundColor(.red)
            
            Spacer() //makes the block pin to the edges
            
            HStack {
                Spacer()
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var theme1: some View {
        Button {
            emojis = vehicles.shuffled()
            emojiCount = Int.random(in: 4...vehicles.count)
        } label: {
            VStack {
                Image(systemName: "car").font(.largeTitle)
                Text("Vehicles").font(.title3)
            }
        }
    }
    var theme2: some View {
        Button {
            emojis = smileys.shuffled()
            emojiCount = Int.random(in: 4...smileys.count)
        } label: {
            VStack {
                Image(systemName: "face.smiling").font(.largeTitle)
                Text("Smileys").font(.title3)
            }
        }
    }
    var theme3: some View {
        Button {
            emojis = weather.shuffled()
            emojiCount = Int.random(in: 4...weather.count)
        } label: {
            VStack {
                Image(systemName: "sun.max").font(.largeTitle)
                Text("Weather").font(.title3)
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true  // { return true } same thing
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius:20) //let => constant
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                // strokeBorder: when we want the borders inside the shape
                Text(content).font(.largeTitle)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
