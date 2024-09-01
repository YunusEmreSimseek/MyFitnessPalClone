//
//  OnboardView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 17.08.2024.
//

import SwiftUI

struct OnboardView: View {
    @State private var onboardVM = OnboardViewModel()
    var body: some View {
        VStack {
            DividerView()
            TabView(selection: $onboardVM.progress) {
                GoalsTabView(onCompletion: { goals in
                    onboardVM.selectedGoals = goals
                })
                .tag(0)
                GoalsMessageView()
                    .tag(1)
                PersonalTabView(onCompletion: { gender, age, location, zipCode in
                    onboardVM.selectedGender = gender
                    onboardVM.selectedAge = age
                    onboardVM.selectedLocation = location
                    onboardVM.selectedZipCode = zipCode
                })
                .tag(2)
                PhysicalTabView(onCompletion: { height, weight, goalWeight in
                    onboardVM.selectedHeight = height
                    onboardVM.selectedWeight = weight
                    onboardVM.selectedGoalWeight = goalWeight
                })
                .tag(3)
                AccountTabView()
                    .tag(4)
                    .environment(onboardVM)
            }
            .topPadding(.low)
            NextButton()
        }
        .allPadding()
        .bottomPadding(.low)
        .modifier(TabBackButtonModifier(selection: $onboardVM.progress))
        .modifier(CenterLoadingModifier())
        .navigationTitle(onboardVM.navigationTitles[onboardVM.progress])
        .navigationBarTitleDisplayMode(.inline)
        .environment(onboardVM)
        .themedBackground()
    }
}

private struct DividerView: View {
    @Environment(OnboardViewModel.self) private var onboardVM

    var body: some View {
        HStack {
            ForEach(0 ... onboardVM.totalParts, id: \.self) { index in
                Rectangle()
                    .fill((index - 1) < onboardVM.progress ? .green : .gray)
                    .frame(height: 4)
            }
        }
    }
}

private struct NextButton: View {
    @Environment(OnboardViewModel.self) private var onboardVM
    var body: some View {
        if onboardVM.progress < onboardVM.totalParts {
            ElevatedButton(title: LocaleKeys.Buttons.next, onTap: {
                if onboardVM.progress < onboardVM.totalParts {
                    onboardVM.progress += 1
                } else {
                    Task { await onboardVM.finishOnboard() }
                }
            })
        }
    }
}

#Preview {
    NavigationStack {
        OnboardView()
    }
}
