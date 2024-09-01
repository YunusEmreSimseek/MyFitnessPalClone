//
//  SocialButton.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct SocialButton: View {
    let title: String
    let image: ImageResource
    let onTap: () -> Void
    var body: some View {
        Button(action: onTap, label: {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(image)
                        .resizable()
                        .frame(width: .medium3, height: .medium3)
                    Text(title)
                        .buttonText()
                    Spacer()
                }
                .allPadding(.low)
                .foregroundStyle(.black)
                .background(.white)
                .clipShape(.rect(cornerRadius: 6))
                .shadow(radius: 10)
            }
        })
    }
}
