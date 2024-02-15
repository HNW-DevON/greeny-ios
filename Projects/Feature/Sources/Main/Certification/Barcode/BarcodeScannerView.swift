import AVFoundation
import SwiftUI
import DesignSystem

struct BarcodeScannerView: View {
    
    @Binding var barcode: Int?
    
    var body: some View {
        ZStack {
            ScannerVCWrapper(delegate: ScannerVCDelegateImpl { barcode in
                if let barcode = Int(barcode) {
                    self.barcode = barcode
                } else {
                    self.barcode = nil
                }
            })
            .ignoresSafeArea()
            Image(Asset.cameraRectangle)
                .resizable()
                .frame(width: 200, height: 200)
            Text(barcode == nil ? "네모 안에 상품을 맞춰주세요" : "스캔 완료! (\(String(barcode!).replacingOccurrences(of: ",", with: "")))")
                .foregroundStyle(barcode == nil ? .white : .green)
                .font(._body)
                .shadow(radius: 3)
                .padding(.top, 200 + 32)
        }
    }
}
