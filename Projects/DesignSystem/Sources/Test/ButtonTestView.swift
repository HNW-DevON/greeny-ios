//
//  ButtonTestView.swift
//  Greeny
//
//  Created by dgsw8th71 on 1/3/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import SwiftUI

public struct ButtonTestView: View {
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 10) {
            GreenyButton(dummyText, buttonType: .main) {
                print(dummyText)
            }
            
            GreenyButton(dummyText, buttonType: .black) {
                print(dummyText)
            }
            
            GreenyButton(dummyText, buttonType: .red) {
                print(dummyText)
            }
            
            GreenyButton(dummyText, buttonType: .none) {
                print(dummyText)
            }
            
            GreenySmallButton(dummyText, buttonType: .main) {
                print(dummyText)
            }
            
            GreenySmallButton(dummyText, buttonType: .black) {
                print(dummyText)
            }
            
            GreenySmallButton(dummyText, buttonType: .red) {
                print(dummyText)
            }
            
            GreenySmallButton(dummyText, buttonType: .none) {
                print(dummyText)
            }
        }
    }
}
