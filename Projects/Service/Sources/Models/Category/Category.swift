//
//  Category.swift
//  Service
//
//  Created by dgsw8th71 on 2/15/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import SwiftUI

public enum Category: String, CaseIterable {
    case environment = "환경"
    case childcare = "보육"
    case employment = "고용"
    case tourismSports = "관광운동"
    case education = "교육"
    case culturalHeritage = "문화재"
    case health = "보건"
    case other = "기타"
    
    
    public static func fromString(_ str: String) -> Category {
        switch str {
        case Category.environment.rawValue: .environment
        case Category.childcare.rawValue: .childcare
        case Category.employment.rawValue: .employment
        case Category.tourismSports.rawValue: .tourismSports
        case Category.education.rawValue: .education
        case Category.culturalHeritage.rawValue: .culturalHeritage
        case Category.health.rawValue: .health
        default: .other
        }
    }
    
    public var foregroundColor: Color {
        switch self {
        case .environment: Color(0xFFCBFFBD)
        case .childcare: Color(0xFFFBCBFF)
        case .employment: Color(0xFFC1ECFF)
        case .tourismSports: Color(0xFFFADCAF)
        case .education: Color(0xFFFDFBBA)
        case .culturalHeritage:  Color(0xFFC5FCF2)
        case .health: Color(0xFFFFD1EA)
        case .other: Color(0xFFEBEBEB)
        }
    }
    
    public var backgroundColor: Color {
        switch self {
        case .environment: Color(0xFF4BE924)
        case .childcare: Color(0xFFE924D6)
        case .employment: Color(0xFF2473E9)
        case .tourismSports: Color(0xFFE94724)
        case .education: Color(0xFFF9C818)
        case .culturalHeritage: Color(0xFF24E9D2)
        case .health: Color(0xFFE9245F)
        case .other: Color(0xFF3B3B3B)
        }
    }
}
