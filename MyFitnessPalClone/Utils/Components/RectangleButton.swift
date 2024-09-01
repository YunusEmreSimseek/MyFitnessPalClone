//
//  RectangleButton.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct RectangleButton: View {
    let title: String
    let onTap: () -> Void
    var body: some View {
        Button(action: onTap, label: {
            HStack {
                Spacer()
                Text(title)
                Spacer()
            }
            .allPadding()
            .foregroundStyle(.cBlack)
            .overlay {
                RoundedRectangle(cornerRadius: 6)
                    .stroke(lineWidth: 0.75)
                    .foregroundStyle(.cBlack)
            }
        })
    }
}
