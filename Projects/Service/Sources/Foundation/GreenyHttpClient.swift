//
//  GreenyHttpClient.swift
//  Service
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire

final class GreenyHttpClient {
    func request<Parameters: Encodable,
                 Response: Decodable>(_ url: String,
                                      _ responseType: Response = VoidResponse(),
                                      method: HTTPMethod = .get,
                                      parameters: Parameters? = nil,
                                      headers: HTTPHeaders? = nil) async throws -> Response {
        try await AF.request(baseUrl + url,
                             method: method,
                             parameters: parameters,
                             encoder: method == .get ? URLEncodedFormParameterEncoder.default: JSONParameterEncoder.default,
                             headers: headers,
                             interceptor: GreenyInterceptor()).validate().serializingDecodable(Response.self).value
    }
}

extension GreenyHttpClient {
    
    static let live = GreenyHttpClient()
    
}
