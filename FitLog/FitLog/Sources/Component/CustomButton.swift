import UIKit
import SnapKit
import Then

class CustomButton: UIButton {
    private func setup(title: String, backgroundColor: UIColor, isEnabled: Bool) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(.gray000, for: .normal)
        self.backgroundColor = backgroundColor
        self.titleLabel?.font = .IBMPlexSansFont(font: .medium, ofSize: 20)
        self.layer.cornerRadius = 12
        self.isEnabled = isEnabled
    }
    
    convenience init(type: UIButton.ButtonType, title: String, backgroundColor: UIColor, isEnabled: Bool) {
        self.init(type: type)
        setup(title: title, backgroundColor: backgroundColor, isEnabled: isEnabled)
    }
    
}

