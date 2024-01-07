//
//  AlimoLogo.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public struct GreenyLogo: View {
    
    var type: GreenyLogoType
    
    public init(type: GreenyLogoType) {
        self.type = type
    }
    
    public var body: some View {
        Image(appName)
            .resizable()
            .frame(width: type.width, height: type.width)
    }
}
