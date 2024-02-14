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
    @Published var isLoading = false
    
    private let userApi = UserApi.live
    
    func login(onSuccess: @escaping (String, Date) -> Void,
               onFail: @escaping () -> Void) async {
        isLoading = true
        do {
            let tokenResponse = try await userApi.login(request: LoginRequest(username: id,
                                                password: pw))
            debugPrint("loginvm - respose")
            let expireAt = Date.fromString(tokenResponse.expireAt)
            onSuccess(String(tokenResponse.token.split(separator: " ")[1]), expireAt)
            isLoading = false
        } catch (let e) {
            print(e)
            isLoading = false
            onFail()
        }
    }
}
