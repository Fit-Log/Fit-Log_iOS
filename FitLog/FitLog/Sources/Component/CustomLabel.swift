import UIKit

class CustomLabel: UILabel {
    
    init(text: String, textColor: UIColor, font: UIFont) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = textColor
        self.font = font
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
