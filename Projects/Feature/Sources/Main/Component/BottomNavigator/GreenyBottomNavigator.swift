//
//  GreenyBottomNavigator.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

struct GreenyBottomNavigator: View {
    
    @Binding var certificationFocused: Bool
    @Binding var selectedTab: GreenyBottomNavigatorType
    @Binding var isClicked: Bool
    public static let bottomList: [GreenyBottomNavigatorType] = [.home, .find, .certification, .quest, .my]
    
    var body: some View {
        HStack(spacing: 44) {
            ForEach(GreenyBottomNavigator.bottomList, id: \.title) { tab in
                let isSelected = tab == selectedTab
                
                Group {
                    if tab == .certification && isSelected {
                        GreenyCameraBottomCeil()
                    } else {
                        GreenyBottomCeil(isSelected: isSelected, bottomType: tab)
                    }
                }
                .onTapGesture {
                    Task {
                        if isSelected && tab == .certification {
                            isClicked = true
                        }
                        withAnimation {
                            selectedTab = tab
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 62)
        .background(Color.white)
        .shadow(color: Color.black.opacity(0.04),
                radius: 100)
        .onChange(of: selectedTab) {
            certificationFocused = $0 == .certification
        }
    }
}
