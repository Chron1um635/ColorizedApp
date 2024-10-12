//
//  TextFieldView.swift
//  ColorizedApp
//
//  Created by Максим Назаров on 10.10.2024.
//

import SwiftUI

struct TextFieldView: View {
    
    @Binding var text: String
    
    let action: () -> Void
    
    var body: some View {
        TextField("0", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
    }
}
