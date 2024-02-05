//
//  QuestResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

struct QuestResponse: Decodable {
    let id: Int
    let questName: String
    let questDesc: String
    let questCurrent: Int
    let questLimit: Int
    let questPoint: Int
    let createdAt: Date
}

typealias QuestsResponse = [QuestResponse]
