//
//  GreenyBottomNavigatorType.swift
//  Feature
//
//  Created by dgsw8th71 on 1/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

enum GreenyBottomNavigatorType: Hashable {
    case home
    case find
    case certification(_ focus: Bool)
    case quest
    case my
    
    var image: String {
        switch self {
        case .home: "Home"
        case .find: "Find"
        case .certification: "Certification"
        case .quest: "Quest"
        case .my: "My"
        }
    }
    
    var title: String {
        switch self {
        case .home: "홈"
        case .find: "탐색"
        case .certification: "인증"
        case .quest: "퀘스트"
        case .my: "MY"
        }
    }
}
