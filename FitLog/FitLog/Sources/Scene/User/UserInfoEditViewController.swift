import UIKit
import RxSwift
import RxCocoa

class UserInfoEditViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let backButton = UIButton(type: .system).then {
        $0.setImage(.leftSlash, for: .normal)
        $0.tintColor = .gray800
    }
    private let navigationBarLabel = UILabel().then {
        $0.text = "내 정보 수정하기"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let finishButton = UIButton(type: .system).then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let heightLabel = UILabel().then {
        $0.text = "키"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let cmLabel = UILabel().then {
        $0.text = "cm"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let heightTextField = CustomTextField(placeholder: "", isSecure: false).then {
        $0.keyboardType = .numberPad
    }
    private let weightLabel = UILabel().then {
        $0.text = "몸무게"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let kgLabel = UILabel().then {
        $0.text = "kg"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let weightTextField = CustomTextField(placeholder: "", isSecure: false).then {
        $0.keyboardType = .numberPad
    }
    private let ageLabel = UILabel().then {
        $0.text = "나이"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let ageTextField = CustomTextField(placeholder: "", isSecure: false).then {
        $0.keyboardType = .numberPad
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetting()
    }
    override func configureUI() {
        super.configureUI()
        
        [
            heightLabel,
            heightTextField,
            weightLabel,
            weightTextField,
            ageLabel,
            ageTextField
        ].forEach({ view.addSubview($0) })
        heightTextField.addSubview(cmLabel)
        weightTextField.addSubview(kgLabel)
        
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        heightLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(149)
            $0.left.equalToSuperview().inset(45)
        }
        heightTextField.snp.makeConstraints {
            $0.top.equalTo(heightLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        cmLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(13)
        }
        weightLabel.snp.makeConstraints {
            $0.top.equalTo(heightTextField.snp.bottom).offset(20)
            $0.left.equalToSuperview().inset(45)
        }
        weightTextField.snp.makeConstraints {
            $0.top.equalTo(weightLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        kgLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(13)
        }
        ageLabel.snp.makeConstraints {
            $0.top.equalTo(weightTextField.snp.bottom).offset(20)
            $0.left.equalToSuperview().inset(45)
        }
        ageTextField.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).offset(5)
            $0.left.right.equalToSuperview().inset(45)
            $0.height.equalTo(50)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
        backButton.rx.tap
            .bind(onNext: {
                self.popViewController()
            }).disposed(by: disposeBag)
        
        finishButton.rx.tap
            .bind(onNext: {
                self.popViewController()
            }).disposed(by: disposeBag)
        
    }
    
    func navigationBarSetting() {
        self.navigationItem.titleView = navigationBarLabel
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: finishButton)
        self.navigationItem.hidesBackButton = false
    }
    
}
