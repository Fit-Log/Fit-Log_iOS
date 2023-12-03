import UIKit
import RxSwift
import RxCocoa

class WorkoutTimeViewController: BaseVC {
    
    private let disposeBag = DisposeBag()
    
    private let mainLogoImage = UIImageView(image: .logo)
    private let goalTimeLabel = UILabel().then {
        $0.text = "오늘의 목표 시간"
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
        $0.textColor = .black
    }
    private let workoutTimeLabel = UILabel().then {
        $0.text = "현재 운동 시간"
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
        $0.textColor = .black
    }
    private let todaysWorkout = UILabel().then {
        $0.text = "오늘의 운동"
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func configureUI() {
        super.configureUI()
        
        [
            mainLogoImage,
            goalTimeLabel,
            workoutTimeLabel,
            todaysWorkout
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
        goalTimeLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(20)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
    }
    
}
