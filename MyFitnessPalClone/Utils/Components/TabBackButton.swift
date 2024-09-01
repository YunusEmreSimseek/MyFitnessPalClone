//
//  TabBackButton.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct TabBackButton: View {
    @Binding var selection: Int
    var body: some View {
        Button(action: { selection -= 1 }, label: {
            Image(systemName: "chevron.left")
                .foregroundStyle(.cBlack)
                .font(.headline)
        })
    }
}
