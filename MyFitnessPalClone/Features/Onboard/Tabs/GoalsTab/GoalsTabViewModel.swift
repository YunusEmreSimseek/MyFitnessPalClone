//
//  GoalsTabViewModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

@Observable
final class GoalsTabViewModel {
    var selectedGoals: [OnboardGoals] = []

    func onGoalsSelection(_ goal: OnboardGoals) {
        if selectedGoals.contains(goal) {
            selectedGoals.removeAll { $0 == goal }
        } else {
            selectedGoals.append(goal)
        }
    }

    func selectiable(_ goal: OnboardGoals) -> Bool {
        selectedGoals.contains(goal)
    }
}

enum OnboardGoals: Codable {
    case loseWeight
    case maintainWeight
    case gainMuscle
    case modifyDiet
    case manageStress
    case increaseStepCount
}
