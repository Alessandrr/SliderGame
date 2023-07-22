//
//  SliderView.swift
//  SliderGame
//
//  Created by Aleksandr Mamlygo on 22.07.23.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @ObservedObject var sliderGame: SliderGame
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.value = Float(sliderGame.currentValue)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(sliderGame.currentValue), animated: true)
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0.2,
            blue: 0.5,
            alpha: CGFloat(sliderGame.computeScore()) / 100
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderGame: sliderGame)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @ObservedObject var sliderGame: SliderGame
        
        init(sliderGame: SliderGame) {
            self.sliderGame = sliderGame
        }
        
        @objc func didChangeSlider(_ sender: UISlider) {
            sliderGame.currentValue = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderGame: SliderGame())
    }
}
