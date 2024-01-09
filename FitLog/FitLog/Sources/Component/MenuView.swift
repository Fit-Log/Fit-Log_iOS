import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class MenuView: UIView {
    
    let label = UILabel().then {
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 20)
        $0.textColor = .gray700
    }
    let editButton = UIButton(type: .system).then {
        $0.setImage(.editIcon, for: .normal)
        $0.tintColor = .gray600
    }
    let kcalLabel = UILabel().then {
        $0.text = "Kcal"
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 18)
        $0.textColor = .main700
    }
    
    
    init(mealTime: String) {
        super.init(frame: .zero)
        label.text = mealTime
        setting()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setting() {
        self.backgroundColor = .white
        self.layer.border(color: .main400, width: 1)
        self.layer.cornerRadius = 12
        self.clipsToBounds = true
    }
    func layout() {
        [
            label,
            editButton,
            kcalLabel,
        ].forEach({ self.addSubview($0) })
        label.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(20)
        }
        editButton.snp.makeConstraints {
            $0.top.right.equalToSuperview().inset(12)
        }
        kcalLabel.snp.makeConstraints {
            $0.right.bottom.equalToSuperview().inset(12)
        }
    }
    
}
