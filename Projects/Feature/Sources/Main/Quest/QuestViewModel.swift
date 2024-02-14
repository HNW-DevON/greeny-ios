//
//  QuestViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 2/14/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import Service
import Alamofire

fileprivate let questApi = QuestApi.live

@MainActor
final class QuestViewModel: ObservableObject {
    
    @Published var completeOrDoingQuest: [Quest] = []
    @Published var doneQuest: [Quest] = []
    @Published var isLoading = true
    
    func loadCompleteOrDoingQuest(onFail: @escaping () -> Void) async {
        isLoading = true
        do {
            completeOrDoingQuest = Array(try await questApi.getQuestAll(type: 1) + questApi.getQuestAll(type: 2)).sorted(by: { i1, i2 in i1.createdAt < i2.createdAt })
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch {
            
        }
        isLoading = true
    }
    
    func loadDone(onFail: @escaping () -> Void) async {
        isLoading = true
        do {
            doneQuest = Array(try await questApi.getQuestAll(type: 1) + questApi.getQuestAll(type: 2)).sorted(by: { i1, i2 in i1.createdAt < i2.createdAt })
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch {
            
        }
        isLoading = true
    }
    
}
