//
//  VisaDetails.swift
//  Unimate
//
//  Created by Muktar Aisak on 20/04/2025.
//

import Foundation

struct VisaDetails: Codable {
    let visaType: String                 // e.g. "500", "485", "600"
    let subclassDescription: String     // e.g. "Student Visa", "Temporary Graduate Visa"
    let issueDate: Date
    let expiryDate: Date
    let passportNumber: String?
    let isBridging: Bool
    let currentStatus: VisaStatus
    let conditions: [String]?           // e.g. ["8105: Work restriction", "8202: Meet course requirements"]

    var daysRemaining: Int {
        Calendar.current.dateComponents([.day], from: Date(), to: expiryDate).day ?? 0
    }

    var isExpired: Bool {
        Date() > expiryDate
    }
}

enum VisaStatus: String, Codable {
    case active
    case expired
    case cancelled
    case pending
}


