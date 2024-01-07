//
//  AlimoButtonType.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

enum GreenyButtonType {
    case main
    case black
    case red
    case gray
    case none
    
    var backgroundColor: Color {
        return switch self {
        case .main: .main600
        case .black: .black
        case .red: .red200
        case .gray: .gray100
        case .none: .white
        }
    }
    
    var foregroundColor: Color {
        return switch self {
        case .main: .black
        case .black: .white
        case .red: .red500
        case .gray: .gray500
        case .none: .main200
        }
    }
}

