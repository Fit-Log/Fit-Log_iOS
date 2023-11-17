import UIKit
import SnapKit
import Then

class MenuTableViewCell: UITableViewCell {
    
    static let cellId = "MenuTableViewCell"
    
    let menuLabel = UILabel().then {
        $0.text = "닭가슴살"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    let kcalLabel = UILabel().then {
        $0.text = "230Kcal"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    let deleteButton = UIButton(type: .system).then {
        $0.setImage(.deleteIcon, for: .normal)
        $0.tintColor = .gray800
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
        configureUI()
        setupConstraints()
    }
    
    func setup() {
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
        contentView.backgroundColor = .main100
        contentView.layer.cornerRadius = 8
    }
    func configureUI() {
        
        [
            menuLabel,
            kcalLabel,
            deleteButton
        ].forEach({ contentView.addSubview($0) })
    }
    func setupConstraints() {
        
        
        menuLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().inset(16)
        }
        kcalLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(menuLabel.snp.right).offset(37)
        }
        deleteButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
            $0.width.height.equalTo(18)
        }
        
    }
    
}
