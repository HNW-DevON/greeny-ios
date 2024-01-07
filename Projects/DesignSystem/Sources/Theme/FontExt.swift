//
//  FontExt.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI


public extension Font {
    
    // pretendard
    static let title = Font.custom(Pretendard.bold.rawValue, size: 24)
    static let subtitle = Font.custom(Pretendard.bold.rawValue, size: 20)
    static let body = Font.custom(Pretendard.bold.rawValue, size: 16)
    static let bodyLight = Font.custom(Pretendard.medium.rawValue, size: 16)
    static let label = Font.custom(Pretendard.medium.rawValue, size: 14)
    static let caption = Font.custom(Pretendard.medium.rawValue, size: 12)
    static let cute = Font.custom(Pretendard.medium.rawValue, size: 10)
}

enum Pretendard: String {
    
    case bold = "Pretendard-Bold"
    case medium = "Pretendard-Medium"
}
