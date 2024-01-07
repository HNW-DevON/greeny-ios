//
//  LogoTestView.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public struct LogoTestView: View {
    
    public init() {}
    
    public var body: some View {
        VStack {
            GreenyLogo(type: .large)
                .padding()
            GreenyLogo(type: .medium)
                .padding()
            GreenyLogo(type: .small)
                .padding()
        }
    }
}
