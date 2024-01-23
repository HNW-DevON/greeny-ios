//
//  Title.swift
//  DesignSystem
//
//  Created by dgsw8th71 on 1/23/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import SwiftUI

public struct GreenyTitle: View {
    
    var title: String
    
    public init(_ title: String) {
        self.title = title
    }
    
    public var body: some View {
        HStack {
            Text(title)
                .font(._title)
                .padding(.leading, 16)
                .padding(.top, 20)
            Spacer()
        }
    }
}
