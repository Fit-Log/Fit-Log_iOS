import UIKit
import RxSwift
import RxCocoa

class PhysicalChangeViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let mainLogoImage = UIImageView(image: .logo)
    private let physicalChangeLabel = UILabel().then {
        $0.text = "조영준님의 신체변화"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let explainLabel = UILabel().then {
        $0.text = "일주일 단위로 달라지는 신체 변화를 체크하세요"
        $0.textColor = .gray600
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let bottomPaddingView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.roundCorners(cornerRadius: 20, maskedCorners: [.layerMaxXMinYCorner, .layerMinXMinYCorner])
        $0.layer.shadow(color: .black, alpha: 0.2, x: 0, y: -3, blur: 7, spread: 0)
        $0.clipsToBounds = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func configureUI() {
        super.configureUI()
        
        [
            mainLogoImage,
            bottomPaddingView,
            physicalChangeLabel,
            explainLabel
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
        physicalChangeLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(35)
            $0.left.equalToSuperview().inset(20)
        }
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(physicalChangeLabel.snp.bottom)
            $0.left.equalToSuperview().inset(20)
        }
        bottomPaddingView.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(82)
            $0.height.equalTo(110)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
    }

}
