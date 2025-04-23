//
//  InputFields.swift
//  Unimate
//
//  Created by Muktar Aisak on 22/04/2025.
//

import SwiftUI

struct InputFields: View {
    
    var title: String
    var placeholder: String
    @Binding var value: String

    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.caption)
            TextField(placeholder, text: $value)
                .autocapitalization(.words)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
        }
    }
}

#Preview {
    @Previewable @State var name = ""
    InputFields(title: "First Name", placeholder: "Enter first name", value: $name)
}
