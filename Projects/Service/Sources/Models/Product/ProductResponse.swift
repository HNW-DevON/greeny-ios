//
//  FindResponse.swift
//  Service
//
//  Created by dgsw8th71 on 2/8/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

public struct ProductResponse: Decodable {
    public let code, message, status: String?
    public let type, gtin, kanCode: String
    public let clsTotalNm: String
    public let baseItems: [BaseItemResponse]
    public let companies: [Companies2Response]
    public let brands: [String]
    public let countries: [Country]
    public let prdComp, originVolume, prdPacTyp: String
    public let images: [String]
    public let isGotPoint: Bool
}

public struct BaseItemResponse: Decodable {
    public let name: String
    public let value: String
}

public struct Companies2Response: Decodable {
    public let type, name: String
    public let addressed: [String]
}

public struct Country: Decodable {
    let name: String
    let value: String
}
