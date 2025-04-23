//
//  ViewModifiers.swift
//  Unimate
//
//  Created by Muktar Aisak on 20/04/2025.
//

import Foundation
import SwiftUI

struct CustomButton: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .cornerRadius(20)
    }
    
}
