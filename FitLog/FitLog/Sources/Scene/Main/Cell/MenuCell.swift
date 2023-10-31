import UIKit
import SnapKit
import Then

class MenuCell: UICollectionViewCell {
    
    static let id = "MenuCell"
    private let anyname = UILabel().then {
        $0.text = "아침"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 20)
    }
    private let menuLabel = UILabel().then {
        $0.text = "닭가슴살 3개\n프로틴 쉐이크\n고구마 반 개\n"
        $0.numberOfLines = 0
        $0.textColor = .gray700
        $0.font = .NotoSansFont(font: .medium, ofSize: 14)
    }
    private let kcalLabel = UILabel().then {
        $0.text = "230Kcal"
        $0.textColor = .main700
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 18)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentViewSetting()
        configureUI()
        setupConstraints()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func contentViewSetting() {
        contentView.backgroundColor = .white
        contentView.layer.borderColor = UIColor.main400.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 12
    }
    func configureUI() {
        
        [
            anyname,
            menuLabel,
            kcalLabel
        ].forEach({ contentView.addSubview($0) })
    }
    func setupConstraints() {
        
        anyname.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
        }
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(anyname.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        kcalLabel.snp.makeConstraints {
            $0.top.equalTo(menuLabel.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
    }
}
