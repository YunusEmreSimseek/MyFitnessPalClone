//
//  PersonalTabViewModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

@Observable
final class PersonalTabViewModel {
    var selectedGender: Gender = .firstCase
    var age: String = ""
    var showLocatinSheet = false
    var selectedLocation = Locations.turkey
    var zipCode: String = ""

    func selectionGender(_ gender: Gender) -> Bool {
        selectedGender == gender
    }

    func firstSelectiableTap() {
        guard selectedGender != Gender.firstCase else { return }
        selectedGender = Gender.firstCase
    }

    func secondSelectiableTap() {
        guard selectedGender != Gender.secondCase else { return }
        selectedGender = Gender.secondCase
    }

    func clearAge() {
        age = ""
    }

    func selectLocation(_ location: Locations) {
        selectedLocation = location
    }
}
