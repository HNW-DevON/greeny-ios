//
//  MyTabView.swift
//  Feature
//
//  Created by dgsw8th71 on 1/24/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

enum MyTabViewType: Hashable, CaseIterable {
    case Encyclopedia
    case Corp
    
    var image: String {
        switch self {
        case .Encyclopedia: "Encyclopedia"
        case .Corp: "Corp"
        }
    }
}
