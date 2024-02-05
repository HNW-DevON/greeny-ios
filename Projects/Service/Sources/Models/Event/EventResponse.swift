//
//  EventResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

struct EventResponse: Decodable {
    let id: Int
    let eventName: String
    let eventDesc: String
    let company: CompanyResponse
}

typealias EventsResponse = [EventResponse]
