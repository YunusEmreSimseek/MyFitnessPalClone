//
//  UserModel.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id: String?
    let name: String?
    let email: String?
    let password: String?
    let age: String?
    let gender: Gender?
    let height: String?
    let weight: String?
    let goalWeight: String?
    let location: Locations?
    let zipCode: String?
    let goals: [OnboardGoals]?
    let createdAt: Date?

    init(
        id: String? = nil,
        name: String? = nil,
        email: String? = nil,
        password: String? = nil,
        age: String? = nil,
        gender: Gender? = nil,
        height: String? = nil,
        weight: String? = nil,
        goalWeight: String? = nil,
        location: Locations? = nil,
        zipCode: String? = nil,
        goals: [OnboardGoals]? = nil,
        createdAt: Date? = nil
    ) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.age = age
        self.gender = gender
        self.height = height
        self.weight = weight
        self.goalWeight = goalWeight
        self.location = location
        self.zipCode = zipCode
        self.goals = goals
        self.createdAt = createdAt
    }

    func copyWith(id: String? = nil,
                  name: String? = nil,
                  email: String? = nil,
                  password: String? = nil,
                  age: String? = nil,
                  gender: Gender? = nil,
                  height: String? = nil,
                  weight: String? = nil,
                  goalWeight: String? = nil,
                  location: Locations? = nil,
                  zipCode: String? = nil,
                  goals: [OnboardGoals]? = nil,
                  createdAt: Date? = nil) -> UserModel
    {
        UserModel(
            id: id ?? self.id,
            name: name ?? self.name,
            email: email ?? self.email,
            password: password ?? self.password,
            age: age ?? self.age,
            gender: gender ?? self.gender,
            height: height ?? self.height,
            weight: weight ?? self.weight,
            goalWeight: goalWeight ?? self.goalWeight,
            location: location ?? self.location,
            zipCode: zipCode ?? self.zipCode,
            goals: goals ?? self.goals,
            createdAt: createdAt ?? self.createdAt
        )
    }
}
