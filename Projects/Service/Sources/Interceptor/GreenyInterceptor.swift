import SwiftUI
import Alamofire

class GreenyInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        print(urlRequest.headers)
        var modifiedRequest = urlRequest
//        modifiedRequest.setValue("your-custom-header-value", forHTTPHeaderField: "Your-Custom-Header")
        
        completion(.success(modifiedRequest))
    }

    func retry(_ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {
        completion(.doNotRetry)
    }
}
