//
//  LoginView.swift
//  Unimate
//
//  Created by Muktar Aisak on 22/04/2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginVM = LoginVM()
    
    @State private var forgotPasswordClicked: Bool = false
    
    // continue with google
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Login")
                .font(.title)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Input fields
            VStack {
                InputFields(title: "Email", placeholder: "Enter your email", value: $loginVM.email)
                InputFields(title: "Password", placeholder: "Enter your paassword", value: $loginVM.password)
                
                // forgot password
                Text("Forgot Password?")
                    .font(.caption)
                    .foregroundStyle(Color.blue)
                    .underline()
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(6)
                    .onTapGesture {
                        forgotPasswordClicked.toggle()
                    }
                
                // auth button
                AuthButton(title: "Login", isDisabled: !loginVM.fieldsOkay) {
                    // login action here
                    Task {
                        await loginVM.login()
                    }
                }
                
            }
        }
        .padding(.horizontal)
        .padding(.top, 32)
        .frame(maxHeight: .infinity, alignment: .top)
        .sheet(isPresented: $forgotPasswordClicked) {
            ForgotPasswordView(email: $loginVM.email, action: {
                // hanlde email
            })
        }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
