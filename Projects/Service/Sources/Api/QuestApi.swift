//
//  QuestApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

fileprivate let client = GreenyHttpClient.live

public final class QuestApi {
    
    
    public func getQuestAll(type: Int) async throws -> Quests {
        try await client.request("/quest?type=\(type)", QuestsResponse.self).map { $0.toDomain(state: QuestState.fromType(type)) }
    }
    
    public func completeQuest(id: Int) async throws -> VoidResponse {
        try await client.request("/quest/complete/\(id)")
    }
    
    public func weekly(type: Int) async throws -> Quests {
        try await client.request("/quest/weekly?type=\(type)", QuestsResponse.self).map { $0.toDomain(state: QuestState.fromType(type)) }
    }
    
    public func newly(type: Int) async throws -> Quests {
        try await client.request("/quest/newly?type=\(type)", QuestsResponse.self).map { $0.toDomain(state: QuestState.fromType(type)) }
    }
}

extension QuestApi {
    public static let live = QuestApi()
}
