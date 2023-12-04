import Foundation

struct AuthModel: Codable {
    let accessToken: String?
    let refreshToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "refresh_token"
        case refreshToken = "access_token"
    }
}
