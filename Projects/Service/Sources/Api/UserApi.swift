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
    
    public func login(request: LoginRequest) async throws -> String {
        try await client.request("/login",
                                 String.self,
                                 method: .post,
                                 parameters: request)
    }
    
    public func editProfile(request: EditProfileRequest) async throws -> String {
        try await client.request("/user/edit",
                                 String.self,
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
}

extension UserApi {
    public static let live = UserApi()
}
