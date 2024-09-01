//
//  SecondView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct GoalsMessageView: View {
    var body: some View {
        VStack(spacing: .medium) {
            Text("Great! You've just taken a big step on your journey.")
                .boldTitleText()
                .multilineTextAlignment(.center)
            VStack(alignment: .leading, spacing: .medium) {
                Text("Did you know that trackig your food is a sicentifically proven method to being successful? It's called self-monitoring and the more consistent you are, the more  likely you are to hit your goals.")

                Text("Now, let's talk about your goal to lose weight.")
                Spacer()
                HStack { Spacer() }
            }
        }
        .themedBackground()
    }
}
