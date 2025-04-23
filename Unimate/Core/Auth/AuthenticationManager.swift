//
//  AuthenticationManager.swift
//  Unimate
//
//  Created by Muktar Aisak on 20/04/2025.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuthCombineSwift
import FirebaseAuth



final class AuthenticationManager {
    
    let auth = Auth.auth()
    
    // email and password signup
    func signup(email: String, password: String) async throws -> AuthDataResult {
        let authDataResult = try await auth.createUser(withEmail: email, password: password)
        return authDataResult
    }
    
    // email and password login
    func login(email: String, password: String) async throws -> AuthDataResult {
        let authDataResult = try await auth.signIn(withEmail: email, password: password)
        return authDataResult
    }
    
    // sign in with google - credentials
    func signInWithGoogle(credential: AuthCredential) async throws {
    }
    
    
}
