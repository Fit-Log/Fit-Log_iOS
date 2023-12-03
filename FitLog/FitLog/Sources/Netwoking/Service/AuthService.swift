import Foundation
import UIKit
import RxSwift
import RxMoya
import Moya

final class AuthService {
    
    func signup(_ signup: SignupInfo) -> Single<networkingResult> {
        return provider.rx.request(.signup(signup))
            .filterSuccessfulStatusCodes()
            .map{ _ -> networkingResult in
                return .createOk
            }
            .catch{[unowned self] in return .just(setNetworkError($0))}
    }
    
    func setNetworkError(_ error: Error) -> networkingResult {
           print(error)
           print(error.localizedDescription)
           guard let status = (error as? MoyaError)?.response?.statusCode else { return (.fault) }
           return (networkingResult(rawValue: status) ?? .fault)
   }

}
