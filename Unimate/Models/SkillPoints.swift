//
//  SkillPoints.swift
//  Unimate
//
//  Created by Muktar Aisak on 20/04/2025.
//

import Foundation

struct SkillPoints: Codable {
    let age: Int
    let englishTestScore: EnglishScore
    let yearsOfWorkExperience: Int
    let australianWorkExperience: Int
    let australianStudy: Bool
    let degreeLevel: DegreeLevel
    let naatiCertified: Bool
    let partnerSkills: Bool

    var totalPoints: Int {
        return agePoints + englishPoints + workPoints + ausWorkPoints + studyPoints + degreePoints + naatiPoints + partnerPoints
    }

    var agePoints: Int {
        switch age {
        case 18...24: return 25
        case 25...32: return 30
        case 33...39: return 25
        case 40...44: return 15
        default: return 0
        }
    }

    var englishPoints: Int {
        switch englishTestScore {
        case .competent: return 0
        case .proficient: return 10
        case .superior: return 20
        }
    }

    var workPoints: Int {
        switch yearsOfWorkExperience {
        case 3...4: return 5
        case 5...7: return 10
        case 8...: return 15
        default: return 0
        }
    }

    var ausWorkPoints: Int {
        switch australianWorkExperience {
        case 1...2: return 5
        case 3...4: return 10
        case 5...: return 20
        default: return 0
        }
    }

    var studyPoints: Int {
        return australianStudy ? 5 : 0
    }

    var degreePoints: Int {
        switch degreeLevel {
        case .bachelor: return 15
        case .masters: return 15
        case .phd: return 20
        case .diploma: return 10
        }
    }

    var naatiPoints: Int {
        return naatiCertified ? 5 : 0
    }

    var partnerPoints: Int {
        return partnerSkills ? 5 : 0
    }
}

enum EnglishScore: String, Codable {
    case competent, proficient, superior
}

enum DegreeLevel: String, Codable {
    case diploma, bachelor, masters, phd
}
