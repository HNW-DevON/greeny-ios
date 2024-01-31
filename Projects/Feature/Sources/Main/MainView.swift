//
//  MainView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

public struct MainView: View {
    
    @State var selectedTab: GreenyBottomNavigatorType = .home
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .home: HomeView()
                case .find: FindView()
                case .certification: CertificationView()
                case .quest: QuestView()
                case .my: MyView()
                }
                VStack {
                    Spacer()
                    GreenyBottomNavigator(selectedTab: $selectedTab)
                }
            }
        }
    }
}
