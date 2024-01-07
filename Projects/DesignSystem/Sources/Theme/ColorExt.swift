//
//  ColorExt.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI


public extension Color {
    
    // main color
    static let main50 = Color(0xFDFEFF)
    static let main100 = Color(0xD4E8FE)
    static let main200 = Color(0xACD3FD)
    static let main300 = Color(0x83BDFD)
    static let main400 = Color(0x5AA7FC)
    static let main500 = Color(0x3292FB)
    static let main600 = Color(0x097CFA)
    static let main700 = Color(0x076CDB)
    
    // gray color
    static let gray100 = Color(0xF4F5F9)
    static let gray300 = Color(0xE6E6E6)
    static let gray400 = Color(0xB6B6B6)
    static let gray500 = Color(0x989899)
    
    // red color
    static let red200 = Color(0xFFE8E8)
    static let red500 = Color(0xF92407)
    
    // etc
    static let yellow500 = Color(0xFFD911)
    static let green500 = Color(0x17D987)
    
}

extension Color {
    
    // hex to color
    init(_ hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}
