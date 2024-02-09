//
//  MyViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/6/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Service
import Foundation

fileprivate let encyclopediaApi = EncycloPediaApi.live
fileprivate let userApi = UserApi.live

@MainActor
final class MyViewModel: ObservableObject {
    
    @Published var encyclopedias: EncycloPedias = []
    @Published var tier = ""
    @Published var left = 0
    @Published var pointHistory: [PointResponse] = []
    @Published var user: UserResponse? = nil
    
    func loadEncyclopedia(onFail: () -> Void) async {
        do {
            encyclopedias = try await encyclopediaApi.getEncyclePediaAll()
            print(encyclopedias)
        } catch (let e) {
            onFail()
            print(e)
        }
    }
    
    func loadPoint(onFail: () -> Void) async {
        do {
            let tierResponse = try await userApi.getTier()
            tier = tierResponse.tier ?? ""
            left = tierResponse.left
        } catch (let e) {
            onFail()
            print(e)
        }
    }
    
    func loadUserInfo(onFail: () -> Void) async {
        do {
            let userResponse = try await userApi.getInfo()
            user = userResponse
            pointHistory = userResponse.pointHistory
        } catch (let e) {
            onFail()
            print(e)
        }
    }
    
}
