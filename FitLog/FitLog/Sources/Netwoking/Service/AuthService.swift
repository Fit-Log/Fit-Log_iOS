import Foundation
import UIKit
import RxSwift
import RxMoya
import Moya

final class AuthService {
    
    let provider = MoyaProvider<AuthAPI>(plugins: [MoyaLoggerPlugin()])
    
    func signup(_ signup: SignupInfo) -> Single<networkingResult> {
        return provider.rx.request(.signup(signup))
            .filterSuccessfulStatusCodes()
            .map{ _ -> networkingResult in
                return .createOk
            }
            .catch{[unowned self] in return .just(setNetworkError($0))}
    }
    
    func passwordCheck(_ password: String) -> Single<networkingResult> {
        return provider.rx.request(.passwordCheck(password: password))
            .filterSuccessfulStatusCodes()
            .map { _ -> networkingResult in
                print("Success")
                return .ok
            }
            .catch{[unowned self] in return .just(setNetworkError($0))}
    }
    
    func login(_ id: String, _ password: String) -> Single<networkingResult> {
        return provider.rx.request(.signin(accountId: id, password: password))
            .filterSuccessfulStatusCodes()
            .map(AuthModel.self)
            .map{ response -> networkingResult in
                Token.accessToken = response.accessToken
                Token.refreshToken = response.refreshToken
                return .ok
            }
            .catch{[unowned self] in return .just(setNetworkError($0))}
    }
    
    func updateUserInfo(_ weight: Int, _ height: Int, _ age: Int) -> Single<networkingResult> {
        return provider.rx.request(.userInfoUpdate(weight: weight, height: height, age: age))
            .filterSuccessfulStatusCodes()
            .map { _ -> networkingResult in
                print("Success")
                return .ok
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
