//
//  QuestType.swift
//  Feature
//
//  Created by dgsw8th71 on 1/27/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import DesignSystem

public enum QuestState: CustomStringConvertible {
    
    case complete
    case doing
    case yet
    
    public var image: String {
        switch self {
        case .complete: Asset.complete
        case .doing: Asset.doing
        case .yet: Asset.yet
        }
    }
    
    public var description: String {
        switch self {
        case .complete: "완료"
        case .doing: "진행중"
        case .yet: "미완료"
        }
    }
    
    public static func fromType(_ type: Int) -> QuestState {
        switch type {
        case 1: .complete
        case 2: .doing
        case 3: .yet
        default: .yet
        }
    }
}
