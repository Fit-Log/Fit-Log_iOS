import Foundation
import Moya

enum AuthAPI {
    case signup(SignupInfo)
    case signin(accountId: String, password: String)
    case userInfoUpdate(weight: Int, height: Int, age: Int)
    case passwordCheck(password: String)
}

extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
            case .signup:
                return "/user/signup"
            case .signin:
                return "/user/signin"
            case .userInfoUpdate:
                return "/user/update"
            case .passwordCheck:
                return "/user"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .userInfoUpdate:
                return .patch
            default:
                return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
            case .signup:
                let signup = SignupInfo.shared
                return .requestParameters(
                    parameters: [
                        "name" : signup.userName.value!,
                        "account_id" : signup.accountId.value!,
                        "password" : signup.password.value!,
                        "age" : signup.age,
                        "year": signup.year,
                        "month": signup.month,
                        "day": signup.day ,
                        "weight" : signup.weight,
                        "height" : signup.height
                    ], encoding: JSONEncoding.default)
            case .signin(let accountId, let password):
                return .requestParameters(
                    parameters: [
                        "accout_id": accountId,
                        "password": password
                    ], encoding: JSONEncoding.default)
            case .userInfoUpdate(let weight, let height, let age):
                return .requestParameters(
                    parameters: [
                        "weight" : weight,
                        "height" : height,
                        "age": age
                    ], encoding: JSONEncoding.default)
            case .passwordCheck(let password):
                return .requestParameters(
                    parameters: [
                        "password_valid": password
                    ], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        switch self {
            case .userInfoUpdate:
                return Header.accessToken.header()
            default:
                return Header.tokenIsEmpty.header()
        }
    }
    
    
}
