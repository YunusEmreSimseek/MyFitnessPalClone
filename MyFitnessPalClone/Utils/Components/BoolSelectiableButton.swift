//
//  BoolSelectiableButton.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct BoolSelectiableButton<T: IBoolSelectiableEnum>: View {
    let selectiable: () -> Bool
    let firstTap: () -> Void
    let secondTap: () -> Void
    var body: some View {
        VStack {
            HStack(spacing: .zero) {
                Button(action: firstTap, label: {
                    HStack {
                        Spacer()
                        Text(T.firstTitle)
                            .subTitleText()
                            .fontWeight(selectiable() ? .bold : .regular)
                        Spacer()
                    }
                    .allPadding()
                    .foregroundStyle(selectiable() ? .blue : .cBlack)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(selectiable() ? .blue : .cBlack, lineWidth: selectiable() ? 2 : 0.75)
                    )
                })
                Button(action: secondTap, label: {
                    HStack {
                        Spacer()
                        Text(T.secondTitle)
                            .subTitleText()
                            .fontWeight(!selectiable() ? .bold : .regular)
                        Spacer()
                    }
                    .allPadding()
                    .foregroundStyle(!selectiable() ? .blue : .cBlack)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(!selectiable() ? .blue : .cBlack, lineWidth: !selectiable() ? 2 : 0.75)
                    )
                })
            }
        }
    }
}
