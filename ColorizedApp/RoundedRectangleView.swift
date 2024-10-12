//
//  RoundedRectangleView.swift
//  ColorizedApp
//
//  Created by Максим Назаров on 10.10.2024.
//

import SwiftUI

struct RoundedRectangleView: View {
    
    let redSliderValue: Double
    let greenSliderValue: Double
    let blueSliderValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 350, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 4)
                    .foregroundStyle(.white)
            )
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

#Preview {
    RoundedRectangleView(redSliderValue: 0, greenSliderValue: 0, blueSliderValue: 0)
}
