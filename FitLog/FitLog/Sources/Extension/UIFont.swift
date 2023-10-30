import UIKit

extension UIFont {
    
    enum NotoSansKR: String {
        case regular = "Regular"
        case medium = "Medium"
        case bold = "Bold"
        case demiLight = "DemiLight"
        case light = "Light"
        case black = "Black"
        case thin = "Thin"
    }

    static func notoSansFont(font: NotoSansKR, ofSize: CGFloat) -> UIFont {
        return UIFont(name: "NotoSansKR-\(font.rawValue)", size: ofSize)!
    }
    
    enum IBMPlexSansKR: String {
        case regular = "Regular"
        case semiBold = "SemiBold"
        case medium = "Medium"
        case bold = "Bold"
    }
    
    static func IBMPlexSansFont(font: IBMPlexSansKR, ofSize: CGFloat) -> UIFont {
        return UIFont(name: "IBMPlexSansKR-\(font.rawValue)", size: ofSize)!
    }
}
