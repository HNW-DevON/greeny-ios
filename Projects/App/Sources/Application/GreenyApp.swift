//
//  App.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/4/24.
//

import SwiftUI
import Feature

@main
struct MyApp: App {
    
    @Environment(\.tokenManager) private var tokenManager
    
    var body: some Scene {
        
        WindowGroup {
            Group {
                if tokenManager.token.isEmpty {
                    OnboardingView()
                } else {
                    MainView()
                }
            }
            .onAppear {
                tokenManager.token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
            }
//            UITestView()
        }
    }
}
