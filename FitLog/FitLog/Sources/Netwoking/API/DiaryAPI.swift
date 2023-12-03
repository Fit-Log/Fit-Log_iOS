import Foundation
import Moya
 
enum DiaryAPI {
    case createDiary(diary: String)
    case loadDiary(diaryId: Int)
}

extension DiaryAPI: TargetType {
    var baseURL: URL {
        return URL(string: "")!
    }
    
    var path: String {
        switch self {
            case .createDiary:
                return "/diary"
            case .loadDiary(let diaryId):
                return "/diary/\(diaryId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .createDiary:
                return .post
            case .loadDiary:
                return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
            case .createDiary(let diary):
                return .requestParameters(
                    parameters: [
                        "diary": diary
                    ], encoding: JSONEncoding.default)
            default:
                return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
            default:
                return Header.tokenIsEmpty.header()
        }
    }
    
    
}
