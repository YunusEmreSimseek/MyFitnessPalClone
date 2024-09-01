//
//  AccountTabView.swift
//  MyFitnessPalClone
//
//  Created by Emre Simsek on 18.08.2024.
//

import SwiftUI

struct AccountTabView: View {
    @State private var accountVM = AccountTabViewModel()

    @Environment(OnboardViewModel.self) private var onboardVM
    var body: some View {
        VStack {
            Text("Almost done! Create your account.")
                .boldTitleText()
            Spacer()
            FieldsView()
            Spacer()
            Text("Your Sign in with email address will be used to forward critical account and scurity updates to your persoal email. Please ensure this connection remains activated in order to receive these messages. ")
                .subText()
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            Spacer()
            VStack {
                HStack(spacing: .normal) {
                    CheckMarkView()
                    Text("I agree to MyFitnessPal's ")
                        + Text("Terms & Conditions ")
                        .foregroundStyle(.cBlue)
                        + Text("and ")
                        + Text("Privacy Policy")
                        .foregroundStyle(.cBlue)
                }
                .subText()

                ElevatedButton(title: "NEXT", onTap: {
                    accountVM.setEmailAndPassword()
                    Task { await onboardVM.finishOnboard() }
                })
            }
        }
        .themedBackground()
        .environment(accountVM)
        .onAppear {
            accountVM.setOnboardViewModel(onboardVM: onboardVM)
        }
    }
}

#Preview {
    AccountTabView()
        .allPadding()
        .environment(OnboardViewModel())
}

private struct FieldsView: View {
    @Environment(AccountTabViewModel.self) private var accountVM
    var body: some View {
        @Bindable var accountVM = accountVM
        VStack(alignment: .leading, spacing: .normal) {
            RemovableTextField(placeHolder: "Email Adress", text: $accountVM.email)

            RemovableTextField(placeHolder: "Password", text: $accountVM.password)
            Text("10 characters minimum")
                .font(.footnote)
                .foregroundStyle(.gray)
        }
    }
}

private struct CheckMarkView: View {
    @Environment(AccountTabViewModel.self) private var accountVM
    var body: some View {
        ZStack {
            if accountVM.isChecked {
                Circle()
                    .foregroundStyle(.cBlue)
                    .frame(height: .dynamicHeight(height: 0.03))
            }
            else {
                Circle()
                    .stroke(.gray, lineWidth: 2)
                    .frame(height: .dynamicHeight(height: 0.03))
            }

            if accountVM.isChecked {
                Image(systemName: "checkmark")
                    .font(.body)
                    .foregroundStyle(.cBlack)
            }
        }
        .onTapGesture {
            accountVM.isChecked.toggle()
        }
    }
}
