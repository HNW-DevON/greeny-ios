//
//  AlimoLogoType.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public enum GreenyLogoType {
    case large
    case medium
    case small
    
    var width: CGFloat {
        return switch self {
        case .large: 100
        case .medium: 32
        case .small: 24
        }
    }
}
