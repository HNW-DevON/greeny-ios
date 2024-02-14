//
//  CertificationViewModel.swift
//  Feature
//
//  Created by dgsw8th71 on 1/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import Foundation
import Service
import AVKit
import SwiftUI
import Combine

@MainActor
class CertificationViewModel: ObservableObject {
    private let camera: Camera
    private let session: AVCaptureSession
    let cameraPreview: AnyView
    @Published var recentImage: UIImage? = nil {
        didSet {
            if recentImage != nil {
                isActive = true
            }
        }
    }
    @Published var isActive = false {
        didSet {
            if !isActive {
                recentImage = nil
            }
        }
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        self.camera = Camera()
        self.session = camera.session
        self.cameraPreview = AnyView(CameraPreviewView(session: session))
        
        camera.$recentImage.sink { [weak self] (photo) in
            guard let pic = photo else { return }
            self?.recentImage = pic
        }
        .store(in: &self.subscriptions)
    }
    
    func capturePhoto() async {
        camera.capturePhoto()
        print("CertificationViewModel - Photo captured!")
    }
    
    func configure() async {
        camera.requestAndCheckPermissions()
    }
    
}
