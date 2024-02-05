//
//  EventApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

final class EventApi {
    
    func getEventAll() async throws -> EventsResponse {
        try await AF.request("/event").serializingDecodable(EventsResponse.self).value
    }
    
    func getEvent(id: Int) async throws -> EventResponse {
        try await AF.request("/event/\(id)").serializingDecodable(EventResponse.self).value
    }
    
}

extension EventApi {
    static let live = EventApi()
}
