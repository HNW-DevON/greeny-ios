//
//  Camera.swift
//  Service
//
//  Created by dgsw8th71 on 1/9/24.
//  Copyright © 2024 hhhello0507. All rights reserved.
//

import AVKit
import Foundation

public class Camera: NSObject, ObservableObject {
    public var session = AVCaptureSession()
    public var videoDeviceInput: AVCaptureDeviceInput!
    public let output = AVCapturePhotoOutput()
    
    var photoData = Data(count: 0)
    @Published public var recentImage: UIImage?
    
    public override init() {}
    
    // 카메라 셋업 과정을 담당하는 함수, positio
    public func setUpCamera() {
        if let device = AVCaptureDevice.default(.builtInWideAngleCamera,
                                                for: .video, position: .back) {
            do { // 카메라가 사용 가능하면 세션에 input과 output을 연결
                videoDeviceInput = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(videoDeviceInput) {
                    session.addInput(videoDeviceInput)
                }
                
                if session.canAddOutput(output) {
                    session.addOutput(output)
                    output.isHighResolutionCaptureEnabled = true
                    output.maxPhotoQualityPrioritization = .quality
                }
                session.startRunning() // 세션 시작
            } catch {
                print(error) // 에러 프린트
            }
        }
    }
    
    public func requestAndCheckPermissions() {
        // 카메라 권한 상태 확인
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .notDetermined:
            // 권한 요청
            AVCaptureDevice.requestAccess(for: .video) { [weak self] authStatus in
                if authStatus {
                    DispatchQueue.main.async {
                        self?.setUpCamera()
                    }
                }
            }
        case .restricted:
            break
        case .authorized:
            // 이미 권한 받은 경우 셋업
            setUpCamera()
        default:
            // 거절했을 경우
            print("Permession declined")
        }
    }
    
    public func capturePhoto() {
        // 사진 옵션 세팅
        let photoSettings = AVCapturePhotoSettings()
        
        self.output.capturePhoto(with: photoSettings, delegate: self)
        print("[Camera]: Photo's taken")
    }
    
    // ✅ 추가
    public func savePhoto(_ imageData: Data) {
        guard let image = UIImage(data: imageData) else { return }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        
        // 사진 저장하기
        print("[Camera]: Photo's saved")
    }
}

extension Camera: AVCapturePhotoCaptureDelegate {
    public func photoOutput(_ output: AVCapturePhotoOutput, 
                            willBeginCaptureFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }
    
    public func photoOutput(_ output: AVCapturePhotoOutput, 
                            willCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }
    
    public func photoOutput(_ output: AVCapturePhotoOutput, 
                            didCapturePhotoFor resolvedSettings: AVCaptureResolvedPhotoSettings) {
    }
    
    public func photoOutput(_ output: AVCapturePhotoOutput, 
                            didFinishProcessingPhoto photo: AVCapturePhoto,
                            error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        
        self.recentImage = UIImage(data: imageData)
        self.savePhoto(imageData)
        
        print("[CameraModel]: Capture routine's done")
    }
}
