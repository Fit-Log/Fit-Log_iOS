import UIKit
import RxSwift
import RxCocoa

class DetailMenuViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let mainLogoImage = UIImageView(image: .logo)
    private let mealTimeLabel = UILabel().then {
        $0.text = "점심"
        $0.textColor = .black
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 20)
    }
    private let addMenuLabel = UILabel().then {
        $0.text = "메뉴 추가하기"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let addMenuButton = UIButton(type: .system).then {
        $0.setImage(.addIcon, for: .normal)
        $0.tintColor = .gray700
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func configureUI() {
        super.configureUI()
        
        [
            mainLogoImage,
            mealTimeLabel,
            addMenuLabel,
            addMenuButton
        ].forEach({ view.addSubview($0) })
        
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        
        mainLogoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(44)
            $0.height.equalTo(36)
        }
        mealTimeLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(20)
        }
        addMenuLabel.snp.makeConstraints {
            $0.top.equalTo(mealTimeLabel.snp.bottom).offset(28)
            $0.left.equalToSuperview().inset(20)
        }
        addMenuButton.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(75)
            $0.right.equalToSuperview().inset(20)
            $0.width.height.equalTo(30)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
        
        
    }
    
}
