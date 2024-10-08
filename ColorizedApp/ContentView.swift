//
//  ContentView.swift
//  ColorizedApp
//
//  Created by Максим Назаров on 08.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            RoundedRectangleView(
                redSliderValue: redSliderValue,
                greenSliderValue: greenSliderValue,
                blueSliderValue: blueSliderValue
            )
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
        .padding()
        Spacer()
    }
}

#Preview {
    ContentView()
}

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double

    let sliderColor: Color
    
    var body: some View {
        HStack {
            Text(round(sliderValue).formatted())
                .frame(width: 40, height: 10)
            Slider(value: $sliderValue, in: 0...255, step: 1)
                .tint(sliderColor)
                .frame(height: 40)
        }
    }
}

struct RoundedRectangleView: View {
    
    let redSliderValue: Double
    let greenSliderValue: Double
    let blueSliderValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 350, height: 200)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 4).foregroundStyle(.white))
            .shadow(color: .gray, radius: 3)
            .foregroundStyle(
                Color(
                    red: redSliderValue / 255,
                    green: greenSliderValue / 255,
                    blue: blueSliderValue / 255
                )
            )
    }
}
