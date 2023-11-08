import UIKit
import RxSwift
import RxCocoa

class IdViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let logoImageView = UIImageView(image: .logo)
    private let signupLabel = CustomLabel(text: "회원가입", textColor: .gray700, font: .IBMPlexSansFont(font: .semiBold, ofSize: 16))
    private let idTextField = CustomTextField(placeholder: "아이디", isSecure: false)
    private let nextButton = CustomButton(type: .system, title: "다음", backgroundColor: .main200, isEnabled: false)
    private let progressLabel = CustomLabel(text: "1/4", textColor: .gray700, font: .IBMPlexSansFont(font: .semiBold, ofSize: 16))
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configureUI() {
        super.configureUI()
        
        [
            logoImageView,
            signupLabel,
            progressLabel,
            idTextField,
            nextButton
        ].forEach({ view.addSubview($0) })
        
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(135)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(96)
            $0.height.equalTo(74)
        }
        signupLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(48)
            $0.left.equalToSuperview().inset(45)
        }
        progressLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(48)
            $0.right.equalToSuperview().inset(45)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(signupLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        nextButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.left.right.equalToSuperview().inset(35)
            $0.height.equalTo(60)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
        let textfield = idTextField.rx.text.orEmpty
        
        textfield
            .map { $0.count != 0 }
            .subscribe(onNext: { change in
                self.nextButton.isEnabled = change
                switch change {
                    case true:
                        self.nextButton.backgroundColor = .main300
                    case false:
                        self.nextButton.backgroundColor = .main200
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
        
        nextButton.rx.tap
            .bind(onNext: {
                self.pushViewController(PasswordViewController())
            }).disposed(by: disposeBag)
        
    }
    
}
