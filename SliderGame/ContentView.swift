//
//  ContentView.swift
//  SliderGame
//
//  Created by Aleksandr Mamlygo on 22.07.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var sliderGame = SliderGame()
    @State private var alertPresented: Bool = false
    
    @State var alpha = 100
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к \(sliderGame.targetValue)")
            HStack {
                Text("0")
                SliderView(value: $sliderGame.currentValue, alpha: alpha)
                    .onChange(of: sliderGame.currentValue) { _ in
                        alpha = sliderGame.computeScore()
                    }
                Text("100")
            }
            Button("Check me") {
                alertPresented.toggle()
            }
            Button("New game") {
                sliderGame.newGame()
                alpha = sliderGame.computeScore()
            }
        }
        .padding()
        .alert(
            "Your result is \(sliderGame.computeScore())",
            isPresented: $alertPresented,
            actions: {}
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
