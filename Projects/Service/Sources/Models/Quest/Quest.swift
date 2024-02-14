//
//  Quest.swift
//  Service
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

public struct Quest: Hashable, Identifiable {
    public let id: Int
    public let questName: String
    public let questDesc: String
    public let questCurrent: Int
    public let questLimit: Int
    public let questPoint: Int
    public let createdAt: Date
    public let questState: QuestState
}

public typealias Quests = [Quest]
