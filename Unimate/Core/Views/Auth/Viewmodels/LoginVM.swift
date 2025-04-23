//
//  LoginVM.swift
//  Unimate
//
//  Created by Muktar Aisak on 22/04/2025.
//

import Foundation
import Combine

final class LoginVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fieldsOkay: Bool = false

    private var cancellables = Set<AnyCancellable>()

    init() {
        setupValidation()
    }

    private func setupValidation() {
        Publishers.CombineLatest($email, $password)
            .map { [weak self] email, password in
                guard let self = self else { return false }
                return self.checkIfFieldsAreCompleted(email: email, password: password)
            }
            .assign(to: &$fieldsOkay)
    }

    private func checkIfFieldsAreCompleted(email: String, password: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)

        return isValidEmail(trimmedEmail) && !trimmedPassword.isEmpty
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
    
    // login func
    func login() async {
    }
}
