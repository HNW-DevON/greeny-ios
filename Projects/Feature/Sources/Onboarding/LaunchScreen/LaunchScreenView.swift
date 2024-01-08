//
//  LaunchScreen.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct LaunchScreenView: View {
    
    public init() {}
    
    public var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    GreenyLogo(type: .large)
                    Text("착한 소비")
                        .font(._subtitle)
                        .padding(.top, 16)
                    Spacer()
                }
                Spacer()
            }
        }
        .background(Color.white)
    }
}
