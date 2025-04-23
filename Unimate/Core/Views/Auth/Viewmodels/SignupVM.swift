//
//  SignupVM.swift
//  Unimate
//
//  Created by Muktar Aisak on 22/04/2025.
//

import Foundation
import Combine

final class SignupVM: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    @Published var fieldsOkay: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupValidation()
    }
    
    private func setupValidation() {
        Publishers.CombineLatest4($email, $password, $firstName, $lastName)
            .map { [weak self] email, password, firstName, lastName in
                guard let self = self else { return false }
                return self.checkIfFieldsAreCompleted(email: email, password: password, firstName: firstName, lastName: lastName)
            }
            .assign(to: &$fieldsOkay)
    }

    private func checkIfFieldsAreCompleted(email: String, password: String, firstName: String, lastName: String) -> Bool {
        let trimmedEmail = email.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedPassword = password.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedFirstName = firstName.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedLastName = lastName.trimmingCharacters(in: .whitespacesAndNewlines)

        return isValidEmail(trimmedEmail) && !trimmedPassword.isEmpty && !trimmedFirstName.isEmpty && !trimmedLastName.isEmpty
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: email)
    }
    
}
