import Foundation
import RxSwift
import RxCocoa

class SignupInfo {
    
    static let shared = SignupInfo()
    
    var userName = BehaviorRelay<String?>(value: nil)
    var accountId = BehaviorRelay<String?>(value: nil)
    var password = BehaviorRelay<String?>(value: nil)//케이스 추가
    var age = BehaviorRelay<Int?>(value: nil)
    var year = BehaviorRelay<Int?>(value: nil)
    var month = BehaviorRelay<Int?>(value: nil)
    var day = BehaviorRelay<Int?>(value: nil)
    var weight = BehaviorRelay<Int?>(value: nil)
    var height = BehaviorRelay<Int?>(value: nil)
    
    private init() { }
}
