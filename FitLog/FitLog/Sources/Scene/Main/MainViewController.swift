import UIKit
import RxSwift
import RxCocoa

class MainViewController: BaseVC {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let mainView = UIView()
    
    private let mainLogoImage = UIImageView(image: UIImage(named: "logo"))
    private let todayLabel = UILabel().then {
        $0.text = "오늘"
        $0.textColor = .black
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 24)
    }
    private let dateLabel = UILabel().then {
        $0.text = "2023-10-24"
        $0.textColor = .gray600
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let blueView = UIView().then {
        $0.backgroundColor = .main600
        $0.layer.cornerRadius = 8
        $0.layer.shadow(color: .black, alpha: 0.2, x: 0, y: 3, blur: 7, spread: 0)
    }
    private let chart = Pie(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
    private let goalsTimeLabel = UILabel().then {
        $0.text = "목표 2시간 30분"
        $0.textColor = .gray400
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let achieveTimeLabel = UILabel().then {
        $0.text = "1시간 15분 30초"
        $0.textColor = .white
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 24)
    }
    private let whiteView = UIView().then {
        $0.backgroundColor = .white
        $0.roundCorners(cornerRadius: 8, maskedCorners: [.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
    }
    private let typeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 36
    }
    private let timeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 75
    }
    private let todaysWorkoutLabel = UILabel().then {
        $0.text = "오늘의 운동"
        $0.textColor = .gray600
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let workoutTypeLabel1 = UILabel().then {
        $0.text = "천국의 계단"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let workoutTime1 = UILabel().then {
        $0.text = "1시간"
        $0.textColor = .main800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let workoutTypeLabel2 = UILabel().then {
        $0.text = "벤치프레스"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let workoutTime2 = UILabel().then {
        $0.text = "5세트"
        $0.textColor = .main800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let workoutTypeLabel3 = UILabel().then {
        $0.text = "데드리프트"
        $0.textColor = .gray800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let workoutTime3 = UILabel().then {
        $0.text = "5세트"
        $0.textColor = .main800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 12)
    }
    private let menuLabel = UILabel().then {
        $0.text = "식단"
        $0.textColor = .gray600
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 20)
    }
    private let menuEditButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "editIcon"), for: .normal)
        $0.tintColor = .gray600
    }
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: "MenuCell")
        return collectionView
    }()
    private let playListView = UIImageView(image: UIImage(named: "playList"))
    private let goalLabel = UILabel().then {
        $0.text = "목표🚩"
        $0.textColor = .gray600
        $0.font = .IBMPlexSansFont(font: .semiBold, ofSize: 20)
    }
    private let explainLabel = UILabel().then {
        $0.text = "매일 나만의 목표를 설정하고 지켜보세요!"
        $0.textColor = .gray600
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 10)
    }
    private let goalEditButton = UIButton(type: .system).then {
        $0.setImage(UIImage(named: "editIcon"), for: .normal)
        $0.tintColor = .gray600
    }
    private let goalView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.layer.border(color: .gray100, width: 1)
    }
    private let goalContentLabel = UILabel().then {
        $0.text = "아 운동해야지........"
        $0.textColor = .main800
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        navigationBarSettting()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    override func configureUI() {
        super.configureUI()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainView)
        
        [
            mainLogoImage,
            todayLabel,
            dateLabel,
            blueView,
            menuLabel,
            menuEditButton,
            collectionView,
            playListView,
            goalLabel,
            explainLabel,
            goalEditButton,
            goalView,
        ].forEach({ mainView.addSubview($0) })
        
        [
            chart,
            goalsTimeLabel,
            achieveTimeLabel,
            whiteView
        ].forEach({ blueView.addSubview($0) })
        
        [
            todaysWorkoutLabel,
            typeStackView,
            timeStackView
        ].forEach({ whiteView.addSubview($0) })
        
        [
            workoutTypeLabel1,
            workoutTypeLabel2,
            workoutTypeLabel3
        ].forEach({ typeStackView.addArrangedSubview($0) })
        
        [
            workoutTime1,
            workoutTime2,
            workoutTime3
        ].forEach({ timeStackView.addArrangedSubview($0) })
        
        goalView.addSubview(goalContentLabel)
        
    }
    override func setupConstraints() {
        super.setupConstraints()
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(self.view)
        }
        mainView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(view.frame.height + 120)
        }
        mainLogoImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.equalTo(44)
            $0.height.equalTo(36)
        }
        todayLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
        }
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(todayLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
        }
        blueView.snp.makeConstraints {
            $0.top.equalTo(dateLabel.snp.bottom).offset(17)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(200)
        }
        chart.snp.makeConstraints {
            $0.top.right.equalToSuperview().inset(20)
            $0.width.height.equalTo(80)
        }
        goalsTimeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.left.equalToSuperview().inset(20)
        }
        achieveTimeLabel.snp.makeConstraints {
            $0.top.equalTo(goalsTimeLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
        }
        whiteView.snp.makeConstraints {
            $0.height.equalTo(85)
            $0.bottom.left.right.equalToSuperview()
        }
        todaysWorkoutLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.left.equalToSuperview().inset(20)
        }
        typeStackView.snp.makeConstraints {
            $0.top.equalTo(todaysWorkoutLabel.snp.bottom).offset(6)
            $0.left.equalToSuperview().inset(20)
        }
        timeStackView.snp.makeConstraints {
            $0.top.equalTo(typeStackView.snp.bottom)
            $0.left.equalToSuperview().inset(20)
        }
        menuLabel.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.bottom).offset(32)
            $0.left.equalToSuperview().inset(20)
        }
        menuEditButton.snp.makeConstraints {
            $0.top.equalTo(blueView.snp.bottom).offset(41)
            $0.right.equalToSuperview().inset(20)
            $0.width.height.equalTo(18)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(menuLabel.snp.bottom).offset(12)
            $0.left.equalToSuperview().inset(20)
            $0.right.equalToSuperview()
            $0.height.equalTo(200)
        }
        playListView.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(32)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(150)
        }
        goalLabel.snp.makeConstraints {
            $0.top.equalTo(playListView.snp.bottom).offset(32)
            $0.left.equalToSuperview().inset(20)
        }
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(goalLabel.snp.bottom).offset(3)
            $0.left.equalToSuperview().inset(20)
        }
        goalEditButton.snp.makeConstraints {
            $0.top.equalTo(goalLabel.snp.top).offset(30)
            $0.right.equalToSuperview().inset(20)
            $0.width.height.equalTo(18)
        }
        goalView.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(12)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(72)
        }
        goalContentLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(12)
            $0.left.right.equalToSuperview().inset(20)
        }
    }
    
    func navigationBarSettting() {
        
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}
