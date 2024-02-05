//
//  JoinSecondViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import Service

@MainActor
final class JoinSecondViewModel: ObservableObject {
    
    private let userService = UserApi.live
    
    func join(id: String,
              pw: String,
              name: String,
              birth: String,
              onSuccess: () -> Void,
              onFail: () -> Void) async {
        do {
            let _ = try await userService.join(request: JoinRequest(username: id,
                                                  password: pw,
                                                  name: name,
                                                  birth: birth))
            onSuccess()
        } catch (let e) {
            print(e)
            onFail()
        }
    }
    
}
