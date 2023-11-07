import UIKit
import SnapKit
import Then

class CustomTextField: UITextField {
    
    private var placeholderText: String = ""

    init(
        placeholder: String,
        isSecure: Bool
    ) {
        super.init(frame: .zero)
        self.isSecureTextEntry = isSecure
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.keyboardType = .alphabet
        self.placeholderText = placeholder
        self.backgroundColor = .white
        self.layer.cornerRadius = 8
        self.textColor = .gray800
        self.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
        self.layer.border(color: .gray300, width: 0.5)
        let spacerView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        self.leftView = spacerView
        self.rightView = spacerView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        placeholderSetting()
    }
    
    func placeholderSetting() {
        self.attributedPlaceholder = NSAttributedString(
            string: placeholderText,
            attributes: [
                NSAttributedString.Key.foregroundColor: UIColor.gray400,
                NSAttributedString.Key.font: UIFont.IBMPlexSansFont(font: .medium, ofSize: 14)
            ]
        )
    }

}
