//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/4/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "App",
    platform: .iOS,
    product: .app,
    dependencies: [
        .Project.DesignSystem,
        .Project.Feature
    ],
    resources: ["Resources/**"],
    infoPlist: .extendingDefault(with: [
        "UIMainStoryboardFile": "",
        "UILaunchStoryboardName": "LaunchScreen",
        "ENABLE_TESTS": .boolean(true),
        "NSAppTransportSecurity": [
            "NSAllowsArbitraryLoads": .boolean(true)
        ],
        "UIUserInterfaceStyle":"Light",
        "NSCameraUsageDescription": "이 앱은 사진을 촬영하기 위해 카메라를 사용합니다. 카메라 접근을 허용해 주세요",
        "NSPhotoLibraryAddUsageDescription": "이 앱은 사진을 촬영 후 저장합니다. 앨범 쓰기 권한을 허용해 주세요."
    ])
)


