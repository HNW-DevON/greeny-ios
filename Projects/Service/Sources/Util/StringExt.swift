//
//  StringExt.swift
//  Service
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

extension String {
    public func toDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
        return dateFormatter.date(from: self) ?? Date.now
    }
}

