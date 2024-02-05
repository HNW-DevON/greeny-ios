//
//  QuestApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

final class QuestApi {
    
    func getQuest(id: Int) async throws -> QuestResponse {
        try await AF.request("/qeust/\(id)", method: .get).serializingDecodable(QuestResponse.self).value
    }
    
    func getQuestAll() async throws -> QuestsResponse {
        try await AF.request("/quest", method: .get).serializingDecodable(QuestsResponse.self).value
    }
    
}

extension QuestApi {
    static let live = QuestApi()
}
