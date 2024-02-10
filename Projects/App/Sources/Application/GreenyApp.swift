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
    @State var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            Group {
                if tokenManager.token.isEmpty {
                    OnboardingView()
                } else {
                    MainView()
                }
            }
            
            
            if isLoading {
                LaunchScreenView().transition(.opacity).zIndex(1)
            }
        }
        .task {
            tokenManager.token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
                withAnimation { isLoading = false }
            })
        }
    }
}
