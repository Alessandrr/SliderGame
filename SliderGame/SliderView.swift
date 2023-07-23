//
//  SliderView.swift
//  SliderGame
//
//  Created by Aleksandr Mamlygo on 22.07.23.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    
    @Binding var value: Double
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.maximumValue = 100
        slider.value = Float(value)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didChangeSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.setValue(Float(value), animated: true)
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0.2,
            blue: 0.5,
            alpha: CGFloat(alpha) / 100
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func didChangeSlider(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(10), alpha: 50)
    }
}
