//
//  EventView.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI
import Service

struct EventView: View {
    
    var event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(event.eventName)
                .font(._body)
            Text(event.eventDesc)
                .font(._label)
        }
        .toLeading()
    }
}
