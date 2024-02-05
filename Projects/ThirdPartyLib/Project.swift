//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/4/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ThirdPartyLib",
    product: .staticFramework,
    dependencies: [
        .SPM.Alamofire,
        .SPM.AlamofireImage
    ],
    resources: ["Resources/**"]
)
