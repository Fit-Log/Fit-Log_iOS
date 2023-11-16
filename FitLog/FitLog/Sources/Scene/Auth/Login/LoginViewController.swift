import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let logoImageView = UIImageView(image: .logo)
    private let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 16)
    }
    private let idTextField = CustomTextField(placeholder: "아이디", isSecure: false)
    private let passwordTextField = CustomTextField(placeholder: "비밀번호", isSecure: true)
    private let loginButton = CustomButton(type: .system, title: "로그인", backgroundColor: .main200, isEnabled: false)
    private let stackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 4
        $0.backgroundColor = .clear
    }
    private let signupLabel = UILabel().then {
        $0.text = "아직 회원이 아니신가요?"
        $0.textColor = .gray600
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let signupButton = LabelButton(type: .system, title: "회원가입하기", titleColor: .main600, font: .IBMPlexSansFont(font: .medium, ofSize: 12))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        
        [
            logoImageView,
            loginLabel,
            idTextField,
            passwordTextField,
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
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(135)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(96)
            $0.height.equalTo(74)
        }
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(48)
            $0.left.equalToSuperview().inset(45)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
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
        
        let textfield = Observable.combineLatest(idTextField.rx.text.orEmpty, passwordTextField.rx.text.orEmpty)
        textfield
            .map { $0.count != 0 && $1.count != 0 }
            .subscribe(onNext: { change in
                self.loginButton.isEnabled = change
                switch change {
                    case true:
                        self.loginButton.backgroundColor = .main300
                    case false:
                        self.loginButton.backgroundColor = .main200
                        
                }
            }).disposed(by: disposeBag)
        
        idTextField.rx.text.orEmpty
            .subscribe(onNext: {
                if $0.isEmpty {
                    self.idTextField.layer.border(color: .gray200, width: 1)
                } else {
                    self.idTextField.layer.border(color: .main300, width: 1)
                }
            }).disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .subscribe(onNext: {
                if $0.isEmpty {
                    self.passwordTextField.layer.border(color: .gray200, width: 1)
                } else {
                    self.passwordTextField.layer.border(color: .main300, width: 1)
                }
            }).disposed(by: disposeBag)
        
        loginButton.rx.tap
            .bind(onNext: {
                self.pushViewController(TabBarVC())
            }).disposed(by: disposeBag)
        
        signupButton.rx.tap
            .bind(onNext: {
                self.pushViewController(IdViewController())
            }).disposed(by: disposeBag)
        
    }
    
}
