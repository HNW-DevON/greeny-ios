//
//  Certification.swift
//  Service
//
//  Created by dgsw8th71 on 2/15/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct Certification: Hashable {
    public let count: Int
    public let product: Product
    public init(count: Int, product: Product) {
        self.count = count
        self.product = product
    }
}
