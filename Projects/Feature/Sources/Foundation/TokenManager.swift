//
//  File.swift
//  App
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import SwiftUI

public class TokenManager: ObservableObject {
    @Published public var token: String {
        didSet {
            UserDefaults.standard.set(token, forKey: "accessToken")
        }
    }

    public init() {
        self.token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
    }
}
