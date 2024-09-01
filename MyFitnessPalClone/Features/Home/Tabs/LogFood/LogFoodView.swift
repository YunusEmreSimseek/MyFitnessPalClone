//
//  LogFoodView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 26.08.2024.
//

import SwiftUI

struct LogFoodView: View {
    var body: some View {
        VStack {
            Text("Log Food View")
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding()
                    .frame(height: .dynamicHeight(height: 0.1))
            }
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Text("PREMIUM")
                        .boldCaptionText()
                    Image(systemName: "crown.fill")
                        .font(.caption)
                        .bottomPadding(.veryLow)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Image(systemName: "bell")
                    .font(.title3)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ScrollView {
            LogFoodView()
        }
    }
}
