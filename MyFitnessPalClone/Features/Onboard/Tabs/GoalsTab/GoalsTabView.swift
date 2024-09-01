//
//  FirstView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct GoalsTabView: View {
    @State private var goalsVM = GoalsTabViewModel()
    var onCompletion: ([OnboardGoals]) -> Void
    var body: some View {
        VStack(spacing: .low) {
            Text(LocaleKeys.GoalsTab.title)
                .boldTitleText()
            VStack(spacing: .low3) {
                Text(LocaleKeys.GoalsTab.subtitle)
                    .subText()
                    .foregroundStyle(.gray)

                VStack(spacing: .low) {
                    SelectiableButton(title: LocaleKeys.GoalsTab.loseWeight, selectiable: {
                        goalsVM.selectiable(.loseWeight)
                    }, onTap: {
                        goalsVM.onGoalsSelection(.loseWeight)
                    })
                    SelectiableButton(title: LocaleKeys.GoalsTab.maintainWeight, selectiable: {
                        goalsVM.selectiable(.maintainWeight)
                    }, onTap: {
                        goalsVM.onGoalsSelection(.maintainWeight)
                    })
                    SelectiableButton(title: LocaleKeys.GoalsTab.gainMuscle, selectiable: {
                        goalsVM.selectiable(.gainMuscle)
                    }, onTap: {
                        goalsVM.onGoalsSelection(.gainMuscle)
                    })
                    SelectiableButton(title: LocaleKeys.GoalsTab.modifyDiet, selectiable: {
                        goalsVM.selectiable(.modifyDiet)
                    }, onTap: {
                        goalsVM.onGoalsSelection(.modifyDiet)
                    })
                    SelectiableButton(title: LocaleKeys.GoalsTab.manageStress, selectiable: {
                        goalsVM.selectiable(.manageStress)
                    }, onTap: {
                        goalsVM.onGoalsSelection(.manageStress)
                    })
                    SelectiableButton(title: LocaleKeys.GoalsTab.increaseStepCount, selectiable: {
                        goalsVM.selectiable(.increaseStepCount)
                    }, onTap: {
                        goalsVM.onGoalsSelection(.increaseStepCount)
                    })
                    Spacer()
                }
            }
        }
        .onDisappear {
            onCompletion(goalsVM.selectedGoals)
        }
        .themedBackground()
    }
}
