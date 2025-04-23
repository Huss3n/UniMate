//
//  AuthButton.swift
//  Unimate
//
//  Created by Muktar Aisak on 22/04/2025.
//

import SwiftUI

struct AuthButton: View {
    var title: String
    var isDisabled: Bool = false
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(isDisabled ? Color.gray.opacity(0.5) : Color.blue)
                .cornerRadius(12)
        }
        .disabled(isDisabled)
        .opacity(isDisabled ? 0.6 : 1)
    }
}
#Preview {
    AuthButton(title: "Signup", isDisabled: true, action: {
        // action here
    })
}
