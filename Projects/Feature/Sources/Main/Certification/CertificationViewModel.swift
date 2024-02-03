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
    
    @Published var viewType: CertificationViewType = .camera
    
    init() {
        self.camera = Camera()
        self.session = camera.session
        self.cameraPreview = AnyView(CameraPreviewView(session: session))
    }
    
    func capturePhoto() {
        print("[CameraViewModel]: Photo captured!")
        self.viewType = .loadingFirst
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewType = .loadingSecond
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            // next view
        }
    }
    
    func configure() {
        camera.requestAndCheckPermissions()
    }
    
}
