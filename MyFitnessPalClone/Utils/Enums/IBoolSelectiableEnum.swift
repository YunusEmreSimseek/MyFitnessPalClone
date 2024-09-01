//
//  IBoolSelectiableEnum.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import Foundation

protocol IBoolSelectiableEnum: CaseIterable, Hashable {
    static var firstCase: Self { get }
    static var secondCase: Self { get }
    static var firstTitle: String { get }
    static var secondTitle: String { get }
}

extension IBoolSelectiableEnum {
    static func allCasesAreValid() -> Bool {
        Array(allCases).count == 2
    }
}

enum Gender: IBoolSelectiableEnum, Codable {
    case male
    case female

    static var firstCase: Gender {
        .male
    }

    static var secondCase: Gender {
        .female
    }

    static var firstTitle: String {
        "Male"
    }

    static var secondTitle: String {
        "Female"
    }
}
