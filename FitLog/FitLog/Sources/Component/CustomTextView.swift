import UIKit
import SnapKit
import Then

class CustomTextView: UITextView {
    
    init() {
        super.init(frame: .zero, textContainer: .none)
        self.textColor = .main800
        self.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
        self.layer.border(color: .gray100, width: 1)
        self.backgroundColor = .white
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        self.textContainerInset = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10)
        self.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
