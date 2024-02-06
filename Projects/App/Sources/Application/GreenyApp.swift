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
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
                .environmentObject(TokenManager())
//            UITestView()
        }
    }
}

private struct ContentView: View {
    
    @EnvironmentObject var tokenManager: TokenManager
    
    var body: some View {
        Group {
            if tokenManager.token.isEmpty {
                OnboardingView()
            } else {
                MainView()
            }
        }
        .onAppear {
            tokenManager.token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
//            tokenManager.token = ""
        }
    }
}
