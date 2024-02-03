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

class CertificationViewModel: ObservableObject {
    private let camera: Camera
    private let session: AVCaptureSession
    let cameraPreview: AnyView
    
    
    init() {
        self.camera = Camera()
        self.session = camera.session
        self.cameraPreview = AnyView(CameraPreviewView(session: session))
    }
    
    func capturePhoto() {
        print("[CameraViewModel]: Photo captured!")
    }
    
    func configure() {
        camera.requestAndCheckPermissions()
    }
    
}
