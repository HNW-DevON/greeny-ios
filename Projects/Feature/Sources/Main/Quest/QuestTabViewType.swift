//
//  Quest.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

enum QuestTabViewType: Hashable, CaseIterable {
    case completeOrDoing
    case done
    
    var text: String {
        switch self {
        case .completeOrDoing: "완료/진행중"
        case .done: "미완료"
        }
    }
}
