//
//  ElevatedButton.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct ElevatedButton: View {
    let title: String
    let onTap: () -> Void
    let fgColor: Color
    let bgColor: Color
    init(title: String, onTap: @escaping () -> Void, fgColor: Color = .cWhite, bgColor: Color = .blue) {
        self.title = title
        self.onTap = onTap
        self.bgColor = bgColor
        self.fgColor = fgColor
    }

    var body: some View {
        Button(action: onTap, label: {
            HStack {
                Spacer()
                Text(title)
                    .buttonText()
                    .fontWeight(.bold)
                    .foregroundStyle(fgColor)
                Spacer()
            }
            .allPadding()
            .background(bgColor)
            .clipShape(.rect(cornerRadius: 6))
        })
    }
}
