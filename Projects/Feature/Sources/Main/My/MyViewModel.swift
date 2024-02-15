//
//  MyViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Service
import Foundation
import Alamofire

fileprivate let encyclopediaApi = EncycloPediaApi.live
fileprivate let userApi = UserApi.live

@MainActor
final class MyViewModel: ObservableObject {
    
    @Published var encyclopedias: [Product] = []
    @Published var tier = ""
    @Published var left = 0
    @Published var pointHistory: [Point] = []
    @Published var user: User? = nil
    @Published var fixName = ""
    @Published var isEncyclopediaLoading = true
    @Published var isPointLoading = true
    @Published var isUserInfoLoading = true
    
    func loadEncyclopedia(onFail: () -> Void) async {
        isEncyclopediaLoading = true
        do {
            encyclopedias = try await encyclopediaApi.getEncyclePediaAll()
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
            print(e)
        } catch (let e) {
            print(e)
        }
        isEncyclopediaLoading = false
    }
    
    func loadPoint(onFail: () -> Void) async {
        isPointLoading = true
        do {
            let tierResponse = try await userApi.getTier()
            tier = tierResponse.tier ?? ""
            left = tierResponse.left
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
            print(e)
        } catch (let e) {
            print(e)
        }
        isPointLoading = false
    }
    
    func loadUserInfo(onFail: () -> Void) async {
        isUserInfoLoading = true
        do {
            let userResponse = try await userApi.getInfo()
            user = userResponse
            fixName = user?.name ?? ""
            pointHistory = userResponse.pointHistory
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
            print(e)
        } catch (let e) {
            print(e)
        }
        isUserInfoLoading = false
    }
    
    func editProfile(onFail: () -> Void) async {
        isUserInfoLoading = true
        do {
            let _ = try await userApi.editProfile(request: EditProfileRequest(name: fixName))
            print("response")
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch (let e) {
            print(e)
        }
        isUserInfoLoading = false
    }
    
}
