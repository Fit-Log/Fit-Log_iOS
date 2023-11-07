import UIKit
import SnapKit
import Then

class LabelButton: UIButton {
    
    func setup(title: String, titleColor: UIColor, font: UIFont) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.backgroundColor = .clear
        self.titleLabel?.font = font
    }
    
    convenience init(type: UIButton.ButtonType, title: String, titleColor: UIColor, font: UIFont) {
        self.init(type: type)
        self.setup(title: title, titleColor: titleColor, font: font)
    }
    
}
