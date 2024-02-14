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
    @State var certificationFocused = false
    @State var isClicked = false
    @State var selectedQuestTab = 0
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            ZStack {
                switch selectedTab {
                case .home: HomeView { idx in
                    withAnimation {
                        selectedQuestTab = idx
                        selectedTab = .quest
                    }
                }
                case .find: FindView()
                case .certification: CertificationView(isClicked: $isClicked)
                case .quest: QuestView(selectedQuestTab: $selectedQuestTab)
                case .my: MyView()
                }
                VStack {
                    Spacer()
                    GreenyBottomNavigator(certificationFocused: $certificationFocused, 
                                          selectedTab: $selectedTab,
                                          isClicked: $isClicked)
                }
            }
        }
    }
}
