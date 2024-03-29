//
//  Dependency+SPM.swift
//  ProjectDescriptionHelpers
//
//  Created by dgsw8th71 on 1/4/24.
//

import ProjectDescription

public extension TargetDependency {
    enum SPM {}
}

public extension TargetDependency.SPM {
    static let Alamofire = TargetDependency.external(name: "Alamofire")
    static let AlamofireImage = TargetDependency.external(name: "AlamofireImage")
    static let SkeletonUI = TargetDependency.external(name: "SkeletonUI")
    static let Lottie = TargetDependency.external(name: "Lottie")
}
