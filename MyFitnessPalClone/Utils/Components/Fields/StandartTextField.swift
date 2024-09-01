//
//  StandartTextField.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 24.08.2024.
//

import SwiftUI

struct StandartTextField: View {
    let placeHolder: String
    @Binding var text: String
    let textAlignment: TextAlignment

    init(placeHolder: String, text: Binding<String>, textAlignment: TextAlignment = .leading) {
        self.placeHolder = placeHolder
        self._text = text
        self.textAlignment = textAlignment
    }

    var body: some View {
        TextField(placeHolder, text: $text)
            .subTitleText()
            .multilineTextAlignment(textAlignment)
            .allPadding()
            .rectangleFieldModifier()
    }
}

#Preview {
    StandartTextField(placeHolder: "placeHolder", text: .constant("text"))
}
