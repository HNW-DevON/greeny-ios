import SwiftUI
import Alamofire

fileprivate let userApi = UserApi.live

class GreenyInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print(urlRequest.headers)
        var modifiedRequest = urlRequest
        modifiedRequest.setValue("Bearer " + (UserDefaults.standard.string(forKey: "accessToken") ?? ""), forHTTPHeaderField: "Authorization")
        
        completion(.success(modifiedRequest))
    }
    
    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        
        completion(.doNotRetry)
    }
}
