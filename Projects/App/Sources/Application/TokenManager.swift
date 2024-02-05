//
//  File.swift
//  App
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import SwiftUI

class TokenManager: ObservableObject {
    @Published var token: String {
        didSet {
            UserDefaults.standard.set(token, forKey: "accessToken")
        }
    }

    init() {
        self.token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
    }
}

struct TokenEnvironmentKey: EnvironmentKey {
    static var defaultValue: TokenManager = TokenManager()
}

extension EnvironmentValues {
    var tokenManager: TokenManager {
        get { self[TokenEnvironmentKey.self] }
        set { self[TokenEnvironmentKey.self] = newValue }
    }
}

