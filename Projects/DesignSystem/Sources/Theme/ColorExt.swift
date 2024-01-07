//
//  ColorExt.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI


extension Color {
    
    // main color
    static public let main50 = Color(0xFDFEFF)
    static public let main100 = Color(0xD4E8FE)
    static public let main200 = Color(0xACD3FD)
    static public let main300 = Color(0x83BDFD)
    static public let main400 = Color(0x5AA7FC)
    static public let main500 = Color(0x3292FB)
    static public let main600 = Color(0x097CFA)
    static public let main700 = Color(0x076CDB)
    
    // gray color
    static public let gray100 = Color(0xF4F5F9)
    static public let gray300 = Color(0xE6E6E6)
    static public let gray400 = Color(0xB6B6B6)
    static public let gray500 = Color(0x989899)
    
    // red color
    static public let red200 = Color(0xFFE8E8)
    static public let red500 = Color(0xF92407)
    
    // etc
    static public let yellow500 = Color(0xFFD911)
    static public let green500 = Color(0x17D987)
    
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
