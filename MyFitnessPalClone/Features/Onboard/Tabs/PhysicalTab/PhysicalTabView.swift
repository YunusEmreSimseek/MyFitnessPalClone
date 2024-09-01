//
//  PhysicalTabView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct PhysicalTabView: View {
    @State private var physicalVM = PhysicalTabViewModel()
    var onCompletion: (String, String, String) -> Void
    var body: some View {
        VStack {
            Text("Just a few more questions")
                .boldTitleText()
            Spacer()
            HeightView()
            Spacer()
            WeightView()
            Spacer()
            GoalWeightView()
            Spacer()
        }
        .themedBackground()
        .environment(physicalVM)
        .onDisappear {
            onCompletion(physicalVM.height, physicalVM.weight, physicalVM.goalWeight)
        }
    }
}

#Preview {
    PhysicalTabView(onCompletion: { _, _, _ in

    })
    .allPadding()
}

private struct HeightView: View {
    @Environment(PhysicalTabViewModel.self) private var physicalVM
    @FocusState private var isFocused: Bool
    var body: some View {
        @Bindable var physicalVM = physicalVM
        VStack(spacing: .normal) {
            Text("How tall are you?")
                .subTitleText()
            HStack(spacing: .low3) {
                Spacer().background()
                TextField("0", text: $physicalVM.height)
                    .subTitleText()
                    .multilineTextAlignment(.trailing)
                    .focused($isFocused)
                    .onChange(of: physicalVM.height) { oldValue, newValue in
                        if newValue.count > 3 {
                            physicalVM.height = oldValue
                        }
                    }
                    .frame(width: .dynamicWidth(width: 0.1))

                Text("cm")
                    .subTitleText()
                Spacer()
            }
            .allPadding()
            .background(.clear)
            .contentShape(.rect)
            .rectangleFieldModifier()
            .onTapGesture {
                isFocused = true
                print("onfocused true")
            }
        }
    }
}

private struct WeightView: View {
    @Environment(PhysicalTabViewModel.self) private var physicalVM
    @FocusState private var isFocused: Bool
    var body: some View {
        @Bindable var physicalVM = physicalVM
        VStack(spacing: .normal) {
            Text("How much do you weigh?")
                .subTitleText()
            VStack(spacing: .low2) {
                HStack(spacing: .low3) {
                    Spacer().background()
                    TextField("0", text: $physicalVM.weight)
                        .subTitleText()
                        .multilineTextAlignment(.trailing)
                        .focused($isFocused)
                        .onChange(of: physicalVM.weight) { oldValue, newValue in
                            if newValue.count > 3 {
                                physicalVM.weight = oldValue
                            }
                        }
                        .frame(width: .dynamicWidth(width: 0.1))

                    Text("kg")
                        .subTitleText()
                    Spacer()
                }
                .allPadding()
                .background(.clear)
                .contentShape(.rect)
                .rectangleFieldModifier()
                .onTapGesture {
                    isFocused = true
                    print("onfocused true")
                }
                Text("It's ok to estimate, you can update this later.")
                    .subText()
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

private struct GoalWeightView: View {
    @Environment(PhysicalTabViewModel.self) private var physicalVM
    @FocusState private var isFocused: Bool
    var body: some View {
        @Bindable var physicalVM = physicalVM
        VStack(spacing: .normal) {
            Text("What is your goal weight?")
                .subTitleText()
            VStack(spacing: .low2) {
                HStack(spacing: .low3) {
                    Spacer().background()
                    TextField("0", text: $physicalVM.goalWeight)
                        .subTitleText()
                        .multilineTextAlignment(.trailing)
                        .focused($isFocused)
                        .onChange(of: physicalVM.goalWeight) { oldValue, newValue in
                            if newValue.count > 3 {
                                physicalVM.goalWeight = oldValue
                            }
                        }
                        .frame(width: .dynamicWidth(width: 0.1))

                    Text("kg")
                        .subTitleText()
                    Spacer()
                }
                .allPadding()
                .background(.clear)
                .contentShape(.rect)
                .rectangleFieldModifier()
                .onTapGesture {
                    isFocused = true
                    print("onfocused true")
                }
                Text("Don't worry, this doesn't affect your daily calorie goal and you can always change it later.")
                    .subText()
                    .foregroundStyle(.gray)
                    .multilineTextAlignment(.center)
            }
        }
    }
}
