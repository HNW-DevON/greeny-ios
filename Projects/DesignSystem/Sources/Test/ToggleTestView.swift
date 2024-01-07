//
//  ToggleTestView.swift
//  App
//
//  Created by dgsw8th71 on 1/7/24.
//  Copyright © 2024 b8nd. All rights reserved.
//

import SwiftUI

public struct ToggleTestView: View {
    
    @State var isOn: Bool = false
    
    public init() {}
    
    public var body: some View {
        VStack {
            GreenyToggle(isOn: $isOn)
                
        }
    }
}
