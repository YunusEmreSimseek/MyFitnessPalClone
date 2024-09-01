//
//  RemovableTextField.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 24.08.2024.
//

import SwiftUI

/// Standart Text Field with a Removable Button
struct RemovableTextField: View {
    let placeHolder: String
    @Binding var text: String
    let textAlignment: TextAlignment

    init(placeHolder: String, text: Binding<String>, textAlignment: TextAlignment = .leading) {
        self.placeHolder = placeHolder
        self._text = text
        self.textAlignment = textAlignment
    }

    var body: some View {
        HStack {
            TextField(placeHolder, text: $text)
                .multilineTextAlignment(textAlignment)
            Button(action: { text = "" }, label: {
                Image(systemName: "xmark")
                    .font(.body)
                    .foregroundStyle(.cBlack)
            })
        }
        .subTitleText()
        .allPadding()
        .rectangleFieldModifier()
    }
}

#Preview {
    RemovableTextField(placeHolder: "Your Age", text: .constant(""))
        .allPadding()
}
