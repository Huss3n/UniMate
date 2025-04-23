//
//  Signup.swift
//  Unimate
//
//  Created by Muktar Aisak on 20/04/2025.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var signupVM = SignupVM()

    @State var showEmailInfo: Bool = false

    var body: some View {
        VStack(spacing: 24) {
            // Header
            header()

            // Input fields
            inputfields()

            // Sign Up Button
            authButton()

            // Or divider
            HStack {
                Rectangle().frame(height: 1).opacity(0.2)
                Text("or")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Rectangle().frame(height: 1).opacity(0.2)
            }

            // Google Sign In Button (image-based)
            Oauth()

            // Already have an account?
            NavigationLink {
                LoginView()
            } label: {
                HStack(alignment: .bottom, spacing: 4) {
                    Text("Already have an account?")
                    Text("Login")
                        .foregroundStyle(.blue)
                        .underline()
                }
                .font(.caption)
            }
        }
        .padding()
        .sheet(isPresented: $showEmailInfo) {
            VStack(spacing: 16) {
                Text("Why we ask for your student email")
                    .font(.title2.bold())
                    .padding(.top)

                Text("Your student email helps us:")
                    .frame(maxWidth: .infinity, alignment: .leading)

                VStack(alignment: .leading, spacing: 8) {
                    Label("Verify you're a current student", systemImage: "checkmark.seal")
                    Label("Auto-match you with your university", systemImage: "graduationcap")
                    Label("Keep our community safe and relevant", systemImage: "shield")
                }

                Button("Got it!") {
                    showEmailInfo = false
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(12)
                .padding(.horizontal)
                .padding(.bottom)
            }
            .padding()
            .presentationDetents([.height(280)])
        }
        
    }
}
#Preview {
    NavigationStack {
        SignUpView()
    }
}


extension SignUpView {
    
    
    // header
    func header() -> some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Sign up")
                .font(.largeTitle.bold())

            Text("Create an account to continue!")
                .font(.headline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    
    // MARK: input fields
    func inputfields() -> some View {
        
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text("First Name")
                    .font(.caption)
                TextField("First name", text: $signupVM.firstName)
                    .autocapitalization(.words)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Last Name")
                    .font(.caption)
                TextField("Last name", text: $signupVM.lastName)
                    .autocapitalization(.words)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }

            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 4) {
                    Text("Student Email")
                        .font(.caption)

                    Button(action: {
                        showEmailInfo = true
                    }) {
                        Image(systemName: "info.circle")
                            .font(.caption)
                            .foregroundColor(.blue)
                    }
                    .accessibilityLabel("Why we need your student email")
                }

                TextField("yourname@ student.uni.edu", text: $signupVM.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text("Password")
                    .font(.caption)
                SecureField("Password", text: $signupVM.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
            }
        }
    }
    
    // MARK: auth button
    func authButton() -> some View {
        Button(action: {
            // handle signup
        }) {
            Text("Sign Up")
                .font(.headline)
                .frame(width: UIScreen.main.bounds.width / 1.5, height: 16)
                .padding()
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(12)
        }
    }
    
    // MARK: 0Auth
    func Oauth() -> some View {
        Button(action: {
            // handle Google sign-in
        }) {
            Image("ios_dark_rd_SU")
                .resizable()
                .scaledToFit()
                .frame(height: 44)
        }
        .buttonStyle(PlainButtonStyle())
        .scaleEffect(1)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.1)) {
                // basic tap feedback
            }
        }
    }
    
}
