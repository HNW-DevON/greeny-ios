//
//  QuestType.swift
//  Feature
//
//  Created by dgsw8th71 on 1/27/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import DesignSystem

enum QuestState: CustomStringConvertible {
    
    case complete
    case doing
    case yet
    
    var image: String {
        switch self {
        case .complete: Asset.complete
        case .doing: Asset.doing
        case .yet: Asset.yet
        }
    }
    
    var description: String {
        switch self {
        case .complete: "완료"
        case .doing: "진행중"
        case .yet: "미완료"
        }
    }
}
