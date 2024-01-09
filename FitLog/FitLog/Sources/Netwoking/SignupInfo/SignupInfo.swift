import Foundation
import RxSwift
import RxCocoa

class SignupInfo {
    
    static let shared = SignupInfo()
    
    var userName: String?
    var accountId: String?
    var password: String?
    var age: Int?
    var year: Int?
    var month: Int?
    var day: Int?
    var weight: Int?
    var height: Int?
    
    private init() {}
    
}
