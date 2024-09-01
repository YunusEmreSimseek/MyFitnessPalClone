//
//  SelectiableButton.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct SelectiableButton: View {
    let title: String
    let selectiable: () -> Bool
    let onTap: () -> Void
    var body: some View {
        Button(action: onTap, label: {
            HStack {
                Spacer()
                Text(title)
                    .subTitleText()
                    .fontWeight(selectiable() ? .bold : .regular)
                Spacer()
            }
            .allPadding()
            .foregroundStyle(selectiable() ? .blue : .cBlack)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: selectiable() ? 2 : 0.75)
                    .foregroundStyle(selectiable() ? .blue : .cBlack)
            }
        })
    }
}
