import UIKit
import RxSwift
import RxCocoa

class OnboardingViewController: BaseVC {
    
    private let disposeBag = DisposeBag()

    private let mainLogo = UIImageView(image: .logo)
    private let loginButton = CustomButton(type: .system, title: "로그인", backgroundColor: .main300, isEnabled: true)
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.backgroundColor = .clear
    }
    private let signupLabel = CustomLabel(text: "아직 회원이 아니신가요?", textColor: .gray600, font: .IBMPlexSansFont(font: .medium, ofSize: 12))
    private let signupButton = LabelButton(type: .system, title: "회원가입하기", titleColor: .main600, font: .IBMPlexSansFont(font: .medium, ofSize: 12))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func configureUI() {
        super.configureUI()
        
        [
            mainLogo,
            loginButton,
            stackView
        ].forEach({ view.addSubview($0) })
            
        [
            signupLabel,
            signupButton
        ].forEach({ stackView.addArrangedSubview($0) })
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        mainLogo.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(316)
            $0.width.equalTo(168)
            $0.height.equalTo(128)
        }
        loginButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(81)
            $0.left.right.equalToSuperview().inset(35)
            $0.height.equalTo(60)
        }
        stackView.snp.makeConstraints {
            $0.top.equalTo(loginButton.snp.bottom).offset(17)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    override func subscribe() {
        super.subscribe()
        
        loginButton.rx.tap
            .bind(onNext: {
                self.pushViewController(LoginViewController())
            }).disposed(by: disposeBag)
        
        signupButton.rx.tap
            .bind(onNext: {
                self.pushViewController(IdViewController())
            }).disposed(by: disposeBag)
    }

}
