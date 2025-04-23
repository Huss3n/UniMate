//
//  ForgotPasswordView.swift
//  Unimate
//
//  Created by Muktar Aisak on 22/04/2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var email: String
    var action: () -> ()

    @State private var isDisabled = true

    var body: some View {
        VStack(spacing: 24) {
            Text("Enter your student email and we'll send you a reset link.")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            TextField("Email Address", text: $email)
                .textContentType(.emailAddress)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color.gray.opacity(0.15))
                .cornerRadius(10)
                .onChange(of: email) { oldValue, newValue in
                    isDisabled = !isValidEmail(newValue)
                }

            AuthButton(title: "Send reset link") {
                action()
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Forgot Password")
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }
    }

    func isValidEmail(_ email: String) -> Bool {
        email.contains("@") && email.contains(".")
    }
}
#Preview {
    @Previewable @State var email: String = ""
    NavigationStack {
        ForgotPasswordView(email: $email, action: { })
    }
}
