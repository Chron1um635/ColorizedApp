//
//  ColorSliderView.swift
//  ColorizedApp
//
//  Created by Максим Назаров on 10.10.2024.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    
    @State private var text = ""
    @State private var showAlert = false

    let sliderColor: Color
    
    var body: some View {
        HStack {
            
            Text(sliderValue.formatted())
                .frame(width: 40, height: 10)
            
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(sliderColor)
                .frame(height: 40)
                .onChange(of: sliderValue) { _, newValue in
                    text = newValue.formatted()
                }
            
            TextFieldView(text: $text, action: checkValue)
                .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
                    Text("Please enter value from 0 to 255")
                }
            
        }
        .onAppear {
            text = sliderValue.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Double(text), (0...255).contains(value) {
            sliderValue = value
        } else {
            showAlert.toggle()
            sliderValue = 0
            text = "0"
        }
    }
}
