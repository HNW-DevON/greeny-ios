//
//  ViewExt.swift
//  Alimo
//
//  Created by dgsw8th71 on 1/4/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public extension View {
    func toLeading() -> some View {
        HStack {
            self
            Spacer()
        }
    }
    
    func toTrailing() -> some View {
        HStack {
            Spacer()
            self
        }
    }
    
    func toTop() -> some View {
        VStack {
            self
            Spacer()
        }
    }
    
    func toBottom() -> some View {
        VStack {
            Spacer()
            self
        }
    }
}
