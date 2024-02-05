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
    
    public func uploadImage(image: UIImage) async throws -> String {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert image to data")
            return "이미지를 불러오는데 실패했습니다"
        }
        
        return try await AF.upload(multipartFormData: {
            $0.append(imageData, withName: "file")
        }, to: "/user/upload", method: .post, headers: []).serializingDecodable(String.self).value
    }
    
    public func join(request: JoinRequest) async throws -> String {
        try await AF.request("/user/register", method: .post, parameters: request).serializingDecodable(String.self).value
    }
    
    public func login(request: LoginRequest) async throws -> String {
        try await AF.request("/login", method: .post, parameters: request).serializingDecodable(String.self).value
    }
    
    public func editProfile(request: EditProfileRequest) async throws -> String {
        try await AF.request("/user/edit", method: .post, parameters: request).serializingDecodable(String.self).value
    }
    
    public func getTier() async throws -> UserTierResponse {
        try await AF.request("/user/tier", method: .get).serializingDecodable(UserTierResponse.self).value
    }
    
    public func getImage() async throws -> UIImage {
        try await AF.request("/user/image").serializingImage().value
    }
}

extension UserApi {
    public static let live = UserApi()
}
