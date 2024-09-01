//
//  PersonalTabView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct PersonalTabView: View {
    @State private var personalVM = PersonalTabViewModel()
    var onCompletion: (Gender, String, Locations, String) -> Void
    var body: some View {
        VStack {
            Text(LocaleKeys.PersonalTab.title)
                .boldTitleText()
            Spacer()
            GenderView()
            Spacer()
            AgeView()
            Spacer()
            LocationView()
        }
        .sheet(isPresented: $personalVM.showLocatinSheet, content: {
            LocationsSheet()
                .presentationDetents([.fraction(0.3)])
        })
        .environment(personalVM)
        .onDisappear {
            onCompletion(personalVM.selectedGender, personalVM.age, personalVM.selectedLocation, personalVM.zipCode)
        }
        .themedBackground()
    }
}

private struct GenderView: View {
    @Environment(PersonalTabViewModel.self) private var personalVM
    var body: some View {
        VStack(spacing: .normal) {
            Text(LocaleKeys.PersonalTab.genderTitle)
                .subTitleText()
                .multilineTextAlignment(.center)
            VStack(spacing: .low3) {
                BoolSelectiableButton<Gender>(selectiable: { personalVM.selectionGender(Gender.firstCase) }, firstTap: { personalVM.firstSelectiableTap() }, secondTap: { personalVM.secondSelectiableTap() })
                HStack(spacing: .low3) {
                    Image(systemName: "questionmark.app.fill")
                        .foregroundStyle(.gray)
                    Text(LocaleKeys.PersonalTab.genderSubTitle)
                        .subText()
                        .foregroundStyle(.gray)
                }
            }
        }
    }
}

private struct AgeView: View {
    @Environment(PersonalTabViewModel.self) private var personalVM
    var body: some View {
        @Bindable var personalVM = personalVM
        VStack(spacing: .normal) {
            Text(LocaleKeys.PersonalTab.ageTitle)
                .subTitleText()
            VStack {
                RemovableTextField(placeHolder: "Your Age", text: $personalVM.age, textAlignment: .center)
                Text(LocaleKeys.PersonalTab.ageSubTitle)
                    .subText()
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

private struct LocationView: View {
    @Environment(PersonalTabViewModel.self) private var personalVM
    var body: some View {
        @Bindable var personalVM = personalVM
        VStack(spacing: .normal) {
            Text(LocaleKeys.PersonalTab.locationTitle)
                .subTitleText()
            HStack {
                Spacer()
                Text(personalVM.selectedLocation.rawValue)
                    .subTitleText()
                Spacer()
            }
            .allPadding()
            .rectangleFieldModifier()
            .onTapGesture {
                personalVM.showLocatinSheet.toggle()
            }
        }
    }
}

private struct LocationsSheet: View {
    @Environment(PersonalTabViewModel.self) private var personalVM
    let locations = Locations.allCases
    func checkSelected(_ location: Locations) -> Bool {
        personalVM.selectedLocation == location
    }

    var body: some View {
        VStack {
            HStack {
                Button(action: { personalVM.showLocatinSheet.toggle() }, label: {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundStyle(.cBlack)
                })
                Spacer()
                Text("Location")
                Spacer()
                Button(action: { personalVM.showLocatinSheet.toggle() }, label: {
                    Image(systemName: "checkmark")
                        .font(.title2)
                        .foregroundStyle(.cBlack)
                })
            }
            .allPadding()
            ScrollView {
                LazyVStack(spacing: .normal) {
                    ForEach(locations, id: \.self) { location in
                        Text(location.rawValue)
                            .foregroundStyle(checkSelected(location) ? .cBlack : .gray)
                            .fontWeight(checkSelected(location) ? .semibold : .regular)
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    personalVM.selectLocation(location)
                                }
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    PersonalTabView(onCompletion: { _, _, _, _ in

    })
    .allPadding()
}
