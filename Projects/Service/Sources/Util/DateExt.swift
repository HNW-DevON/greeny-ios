//
//  DateExt.swift
//  Service
//
//  Created by dgsw8th71 on 2/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation

extension Date {
    
    public var components: DateComponents {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day, .weekday, .second, .minute, .hour], from: self)
        return components
    }
    
    public static func 요일내놔(from str: Int) -> String {
        switch str {
        case 1: "일"
        case 2: "월"
        case 3: "화"
        case 4: "수"
        case 5: "목"
        case 6: "금"
        case 7: "토"
        default: ""
        }
    }
    
    public func timeAgoString() -> String {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.minute, .hour, .day], from: self, to: now)
        
        if let days = components.day, days > 0 {
            return "\(days)일 전"
        } else if let hours = components.hour, hours > 0 {
            return "\(hours)시간 전"
        } else if let minutes = components.minute, minutes > 0 {
            return "\(minutes)분 전"
        } else {
            return "방금 전"
        }
    }
    
    public static func fromString(_ string: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSS"
        dateFormatter.locale = Locale(identifier: "ko_KR")
        if let result = dateFormatter.date(from: string.replacingOccurrences(of: "T", with: " ")) {
            return result
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.date(from: string.replacingOccurrences(of: "T", with: " ")) ?? Date()
        }
    }
}
