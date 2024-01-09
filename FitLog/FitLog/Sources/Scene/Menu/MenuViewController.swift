import UIKit
import RxSwift
import RxCocoa

class MenuViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let mainLogoImage = UIImageView(image: .logo)
    private let addMenuLabel = UILabel().then {
        $0.text = "식단 추가하기"
        $0.textColor = .black
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let breakfastView = MenuView(mealTime: "아침")
    private let lunchView = MenuView(mealTime: "점심")
    private let dinnerView = MenuView(mealTime: "저녁")
    //dinnerView 버튼에 직접 접근하는게 나은지 지정해놓고 사용하는게 나은지...
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configureUI() {
        super.configureUI()
        
        [
            mainLogoImage,
            addMenuLabel,
            breakfastView,
            lunchView,
            dinnerView
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
        addMenuLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(20)
        }
        breakfastView.snp.makeConstraints {
            $0.top.equalTo(addMenuLabel.snp.bottom).offset(15)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        lunchView.snp.makeConstraints {
            $0.top.equalTo(breakfastView.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        dinnerView.snp.makeConstraints {
            $0.top.equalTo(lunchView.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(100)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
        let vc = DetailMenuViewController()
        
        breakfastView.editButton.rx.tap
            .bind(onNext: {
                vc.setter(mealTime: "아침")
                self.pushViewController(vc)
            }).disposed(by: disposeBag)
        
        lunchView.editButton.rx.tap
            .bind(onNext: {
                vc.setter(mealTime: "점심")
                self.pushViewController(vc)
            }).disposed(by: disposeBag)
        
        dinnerView.editButton.rx.tap
            .bind(onNext: {
                vc.setter(mealTime: "저녁")
                self.pushViewController(vc)
            }).disposed(by: disposeBag)
//        breakfastView.
        
    }
    
}
