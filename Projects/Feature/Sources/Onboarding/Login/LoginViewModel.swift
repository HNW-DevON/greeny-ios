//
//  LoginViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Service
import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
    
    @Published var id = ""
    @Published var pw = ""
    
    private let userApi = UserApi.live
    
    func login(onSuccess: (String) -> Void,
               onFail: () -> Void) async {
        do {
            
            let token = try await userApi.login(request: LoginRequest(username: id,
                                                                      password: pw)).split(separator: " ")[1]
            print(token)
            onSuccess(String(token))
        } catch (let e) {
            print(e)
            onFail()
        }
    }
}
