//
//  User.swift
//  Unimate
//
//  Created by Muktar Aisak on 20/04/2025.
//

import Foundation


struct StudentProfile: Codable {
    let country: String
    let university: String?
    let isVerifiedStudent: Bool
    let visa: VisaData?
}


struct UserModel: Codable {
    let firstName: String
    let lastName: String
    let email: String
    let profile: StudentProfile?
    let createdAt: Date
}


struct VisaData: Codable {
    let visaType: String
    let issueDate: Date
    let expiryDate: Date
    let isBridging: Bool
    let isActive: Bool

    // calcuate the number of days remaining - will use for notifications 
    var daysRemaining: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: expiryDate).day ?? 0
    }

    // check if the visa is expired
    var isExpired: Bool {
        Date() > expiryDate
    }
}
