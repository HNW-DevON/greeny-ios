//
//  UserApi.swift
//  Service
//
//  Created by dgsw8th71 on 2/5/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

public final class UserApi {
    
    private let client = GreenyHttpClient.live
    
    public func uploadImage(image: UIImage) async throws -> String {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert image to data")
            return "이미지를 불러오는데 실패했습니다"
        }
        
        return try await client.upload(multipartFormData: {
            $0.append(imageData, withName: "file")
        },
                                       to: "/user/upload",
                                       String.self,
                                       method: .post)
    }
    
    public func join(request: JoinRequest) async throws -> VoidResponse {
        try await client.request("/user/register",
                                 method: .post,
                                 parameters: request)
    }
    
    public func login(request: LoginRequest) async throws -> TokenResponse {
        try await AF.upload(
            multipartFormData: {
                $0.append(request.username.data(using: .utf8)!, withName: "username")
                $0.append(request.password.data(using: .utf8)!, withName: "password")
            }, to: baseUrl + "/login",
            method: .post,
            interceptor: GreenyInterceptor()
        ).validate().serializingDecodable(TokenResponse.self).value
    }
    
    public func editProfile(request: EditProfileRequest) async throws -> VoidResponse {
        try await client.request("/user/edit",
                                 VoidResponse.self,
                                 method: .post,
                                 parameters: request)
    }
    
    public func getTier() async throws -> UserTierResponse {
        try await client.request("/user/tier",
                                 UserTierResponse.self)
    }
    
    public func getImage() async throws -> UIImage {
        try await client.requestImage("/user/image")
    }
    
    public func getInfo() async throws -> User {
        try await client.request("/user/info", UserResponse.self).toDomain()
    }
}

extension UserApi {
    public static let live = UserApi()
}
