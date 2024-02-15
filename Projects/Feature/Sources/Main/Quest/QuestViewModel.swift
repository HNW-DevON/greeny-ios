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
            completeOrDoingQuest = try await questApi.getQuestAll(type: 1)
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
            doneQuest = try await questApi.getQuestAll(type: 2)
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch {
            print(error)
        }
        isLoading = true
    }
    
    func completeQuest(quest: Quest,
                       onSuccess: @escaping () -> Void,
                       onFail: @escaping () -> Void) async {
        do {
            print("QuestViewModel.completeQuest - try complete quest")
            let _ = try await questApi.completeQuest(id: quest.id)
            onSuccess()
            print("QuestViewModel.completeQuest - to complete quest is success")
        } catch AFError.responseValidationFailed(let e) {
            if isUnauthorized(e) {
                onFail()
            }
        } catch {
            print(error)
        }
    }
    
}
