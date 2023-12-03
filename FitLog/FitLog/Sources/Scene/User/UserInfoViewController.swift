import UIKit
import RxSwift
import RxCocoa

class UserInfoViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let backButton = UIButton(type: .system).then {
        $0.setImage(.leftSlash, for: .normal)
        $0.tintColor = .gray800
    }
    private let navigationBarLabel = UILabel().then {
        $0.text = "마이페이지"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let userNameLabel = UILabel().then {
        $0.text = "조영준님,\n안녕하세요!"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 24)
        $0.numberOfLines = 2
    }
    private let userInfoEditButton = UIButton(type: .system).then {
        $0.backgroundColor = .gray400
        $0.layer.cornerRadius = 8
        $0.setTitle("내 정보 수정", for: .normal)
        $0.setTitleColor(.gray000, for: .normal)
        $0.titleLabel?.font = .IBMPlexSansFont(font: .medium, ofSize: 10)
    }
    private let userInfoView = UIView().then {
        $0.backgroundColor = .main400
        $0.layer.cornerRadius = 8
        $0.clipsToBounds = true
    }
    private let intervalView1 = UIView().then {
        $0.backgroundColor = .gray200
    }
    private let intervalView2 = UIView().then {
        $0.backgroundColor = .gray200
    }
    private let heightLabel = UILabel().then {
        $0.text = "키"
        $0.textColor = .gray000
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let cmLabel = UILabel().then {
        $0.text = "170"
        $0.textColor = .gray000
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 20)
    }
    private let weightLabel = UILabel().then {
        $0.text = "몸무게"
        $0.textColor = .gray000
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let kgLabel = UILabel().then {
        $0.text = "100"
        $0.textColor = .gray000
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 20)
    }
    private let ageLabel = UILabel().then {
        $0.text = "나이"
        $0.textColor = .gray000
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let oldLabel = UILabel().then {
        $0.text = "50세"
        $0.textColor = .gray000
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 20)
    }
    private let membershipStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 36
        $0.backgroundColor = .none
    }
    private let logoutButton = UIButton(type: .system).then {
        $0.setTitle("로그아웃", for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .IBMPlexSansFont(font: .medium, ofSize: 10)
    }
    private let membershipCancelButton = UIButton(type: .system).then {
        $0.setTitle("회원탈퇴", for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .IBMPlexSansFont(font: .medium, ofSize: 10)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBarSetting()
    }
    override func configureUI() {
        super.configureUI()
        
        [
            userNameLabel,
            userInfoEditButton,
            userInfoView,
            membershipStackView
        ].forEach({ view.addSubview($0) })
        
        [intervalView1, intervalView2].forEach({ userInfoView.addSubview($0) })
        
        [logoutButton, membershipCancelButton].forEach({ membershipStackView.addArrangedSubview($0) })
        
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(149)
            $0.left.equalToSuperview().inset(20)
        }
        userInfoEditButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(198)
            $0.right.equalToSuperview().inset(20)
            $0.width.equalTo(80)
            $0.height.equalTo(24)
        }
        userInfoView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(30)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(60)
        }
        intervalView1.snp.makeConstraints {
            $0.left.equalToSuperview().inset((view.frame.width - 40) / 3)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(7)
            $0.height.equalTo(48)
        }
        intervalView2.snp.makeConstraints {
            $0.right.equalToSuperview().inset((view.frame.width - 40) / 3)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(7)
            $0.height.equalTo(48)
        }
        membershipStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(userInfoView.snp.bottom).offset(52)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
        backButton.rx.tap
            .bind(onNext: {
                self.popViewController()
            }).disposed(by: disposeBag)
        
        userInfoEditButton.rx.tap
            .bind(onNext: {
                self.pushViewController(UserInfoEditViewController())
            }).disposed(by: disposeBag)
        
    }
    
    func navigationBarSetting() {
        self.navigationItem.titleView = navigationBarLabel
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.hidesBackButton = false
    }
    
}
