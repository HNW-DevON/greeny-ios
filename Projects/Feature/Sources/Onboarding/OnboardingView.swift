//
//  OnboardingView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import DesignSystem

public struct OnboardingView: View {
    
    @State var isLoading: Bool = true
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    
                }
                VStack {
                    Spacer()
                    NavigationLink {
                        LoginView()
                    } label: {
                        GreenyButton("시작하기") {}.disabled(true)
                            .padding(.bottom, 16)
                    }
                    
                    
                }
                
                if isLoading {
                    LaunchScreenView().transition(.opacity).zIndex(1)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                    withAnimation { isLoading = false }
                })
            }
        }
    }
}
