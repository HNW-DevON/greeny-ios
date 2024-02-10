//
//  Http.swift
//  Service
//
//  Created by dgsw8th71 on 2/10/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

public func isUnauthorized(_ error: AFError.ResponseValidationFailureReason) -> Bool {
    switch error {
    case .unacceptableStatusCode(code: let code):
        return code == 401
    default:
        return false
    }
}
