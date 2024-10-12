//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Максим Назаров on 08.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255).rounded()
    @State private var greenSliderValue = Double.random(in: 0...255).rounded()
    @State private var blueSliderValue = Double.random(in: 0...255).rounded()
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        ZStack {
            VStack {
                RoundedRectangleView(
                    redSliderValue: redSliderValue,
                    greenSliderValue: greenSliderValue,
                    blueSliderValue: blueSliderValue
                )
                VStack {
                    ColorSliderView(
                        sliderValue: $redSliderValue,
                        sliderColor: .red
                    )
                    ColorSliderView(
                        sliderValue: $greenSliderValue,
                        sliderColor: .green
                    )
                    ColorSliderView(
                        sliderValue: $blueSliderValue,
                        sliderColor: .blue
                    )
                }
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
            }
            .padding()
            .onTapGesture {
                isInputActive = false
        }
    }
}

#Preview {
    ContentView()
}
