//
//  BackButton.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        Button(action: { dismiss() }, label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.cBlack)
                .font(.headline)
        })
    }
}

#Preview {
    BackButton()
}
