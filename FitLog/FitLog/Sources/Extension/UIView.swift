import UIKit

extension UIView {
    func corner(conerRadius: CGFloat) {
        self.layer.cornerRadius = conerRadius
        self.clipsToBounds = true
    }
    
    func roundCorners(cornerRadius: CGFloat, maskedCorners: CACornerMask) {
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
}
