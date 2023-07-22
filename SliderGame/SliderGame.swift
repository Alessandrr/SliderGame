//
//  SliderGame.swift
//  SliderGame
//
//  Created by Aleksandr Mamlygo on 22.07.23.
//

import Foundation

class SliderGame: ObservableObject {
    @Published var targetValue = Int.random(in: 1...100)
    @Published var currentValue = 50.0
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
    func newGame() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
    }
}
