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
    
    func login(onSuccess: @escaping (String) -> Void,
               onFail: @escaping () -> Void) async {
        userApi.login(request: LoginRequest(username: id,
                                            password: pw), onSuccess: { token in
            print(token)
            onSuccess(String(token.split(separator: " ")[1]))
        }, onFail: onFail)
    }
}
