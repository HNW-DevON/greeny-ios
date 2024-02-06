//
//  GreenyHttpClient.swift
//  Service
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Alamofire
import UIKit

final class GreenyHttpClient {
    func request<Parameters: Encodable,
                 Response: Decodable>(_ url: String,
                                      _ responseType: Response.Type = VoidResponse.self,
                                      method: HTTPMethod,
                                      parameters: Parameters? = nil,
                                      headers: HTTPHeaders? = nil) async throws -> Response {
        try await AF.request(baseUrl + url,
                             method: method,
                             parameters: parameters,
                             encoder: JSONParameterEncoder.default,
                             headers: headers,
                             interceptor: GreenyInterceptor())
        .validate()
        .serializingDecodable(responseType).value
    }
    
    func request<Response: Decodable>(_ url: String,
                                      _ responseType: Response.Type = VoidResponse.self,
                                      method: HTTPMethod = .get,
                                      headers: HTTPHeaders? = nil) async throws -> Response {
        try await AF.request(baseUrl + url,
                             method: method,
                             headers: headers,
                             interceptor: GreenyInterceptor())
        .validate()
        .serializingDecodable(responseType).value
    }
    
    func requestImage(_ url: String,
                      method: HTTPMethod = .get,
                      headers: HTTPHeaders? = nil) async throws -> UIImage {
        try await AF.request(baseUrl + url,
                             method: method,
                             headers: headers,
                             interceptor: GreenyInterceptor())
        .validate()
        .serializingImage().value
    }
    
    func upload<Response: Decodable>(multipartFormData: @escaping (MultipartFormData) -> Void,
                                     to url: String,
                                     _ responseType: Response.Type = VoidResponse.self,
                                     usingThreshold encodingMemoryThreshold: UInt64 = MultipartFormData.encodingMemoryThreshold,
                                     method: HTTPMethod = .post,
                                     headers: HTTPHeaders? = nil,
                                     interceptor: RequestInterceptor? = nil,
                                     fileManager: FileManager = .default) async throws -> Response {
        try await AF.upload(multipartFormData: multipartFormData,
                            to: baseUrl + url,
                            usingThreshold: encodingMemoryThreshold,
                            method: method,
                            headers: headers,
                            interceptor: GreenyInterceptor()).serializingDecodable(responseType).value
    }
    
}

extension GreenyHttpClient {
    
    static let live = GreenyHttpClient()
    
}
