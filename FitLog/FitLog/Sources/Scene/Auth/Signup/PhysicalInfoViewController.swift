import UIKit
import RxSwift
import RxCocoa

class PhysicalInfoViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let logoImageView = UIImageView(image: .logo)   
    private let signupLabel = UILabel().then {
        $0.text = "회원가입"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 16)
    }
    private let progressLabel = UILabel().then {
        $0.text = "4/4"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 16)
    }
    private let weightTextField = CustomTextField(placeholder: "몸무게", isSecure: false).then {
        $0.keyboardType = .numberPad
    }
    private let heightTextField = CustomTextField(placeholder: "키", isSecure: false).then {
        $0.keyboardType = .numberPad
    }
    private let kgLabel = UILabel().then {
        $0.text = "kg"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let cmLabel = UILabel().then {
        $0.text = "cm"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let signupButton = CustomButton(type: .system, title: "가입하기", backgroundColor: .main200, isEnabled: false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func configureUI() {
        super.configureUI()
        
        [
            logoImageView,
            signupLabel,
            progressLabel,
            weightTextField,
            heightTextField,
            signupButton
        ].forEach({ view.addSubview($0) })
        
        weightTextField.addSubview(kgLabel)
        heightTextField.addSubview(cmLabel)
        
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
        weightTextField.snp.makeConstraints {
            $0.top.equalTo(signupLabel.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        kgLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
        }
        heightTextField.snp.makeConstraints {
            $0.top.equalTo(weightTextField.snp.bottom).offset(16)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        cmLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(16)
        }
        signupButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(48)
            $0.left.right.equalToSuperview().inset(35)
            $0.height.equalTo(60)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
        let textfield = Observable.combineLatest(weightTextField.rx.text.orEmpty, heightTextField.rx.text.orEmpty)
        textfield
            .map { $0.count != 0 && $1.count != 0 }
            .subscribe(onNext: { change in
                self.signupButton.isEnabled = change
                switch change {
                    case true:
                        self.signupButton.backgroundColor = .main300
                    case false:
                        self.signupButton.backgroundColor = .main200
                        
                }
            }).disposed(by: disposeBag)
        
        weightTextField.rx.text.orEmpty
            .subscribe(onNext: {
                if $0.isEmpty {
                    self.weightTextField.layer.border(color: .gray200, width: 1)
                } else {
                    self.weightTextField.layer.border(color: .main300, width: 1)
                }
            }).disposed(by: disposeBag)
        
        heightTextField.rx.text.orEmpty
            .subscribe(onNext: {
                if $0.isEmpty {
                    self.heightTextField.layer.border(color: .gray200, width: 1)
                } else {
                    self.heightTextField.layer.border(color: .main300, width: 1)
                }
            }).disposed(by: disposeBag)
        
        signupButton.rx.tap
            .bind(onNext: {
                self.pushViewController(LoginViewController())
            }).disposed(by: disposeBag)
        
    }
    
}
