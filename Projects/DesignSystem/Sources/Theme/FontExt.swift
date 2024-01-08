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
    static let _title = Font.custom(Pretendard.bold.rawValue, size: 24)
    static let _subtitle = Font.custom(Pretendard.bold.rawValue, size: 20)
    static let _body = Font.custom(Pretendard.bold.rawValue, size: 16)
    static let _bodyLight = Font.custom(Pretendard.medium.rawValue, size: 16)
    static let _label = Font.custom(Pretendard.medium.rawValue, size: 14)
    static let _caption = Font.custom(Pretendard.medium.rawValue, size: 12)
    static let _cute = Font.custom(Pretendard.medium.rawValue, size: 10)
}

enum Pretendard: String {
    
    case bold = "Pretendard-Bold"
    case medium = "Pretendard-Medium"
}
