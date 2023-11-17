import UIKit

class MenuTextField: UITextField {
    
    var placeholderText: String = ""
    
    init(
        placeholder: String
    ) {
        super.init(frame: .zero)
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.backgroundColor = .gray100
        self.textColor = .gray800
        self.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
        self.placeholderText = placeholder
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        self.leftView = spacerView
        self.leftViewMode = .always
        self.layer.cornerRadius = 8
        setting()
    }
    
    func setting() {
            self.attributedPlaceholder = NSAttributedString(
                string: placeholderText,
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor.gray,
                    NSAttributedString.Key.font: UIFont.IBMPlexSansFont(font: .medium, ofSize: 14)
                ]
            )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
