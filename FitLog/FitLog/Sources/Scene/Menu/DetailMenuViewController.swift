import UIKit
import RxSwift
import RxCocoa

class DetailMenuViewController: BaseVC {//MARK: 입력한 메뉴를 서버에 보내줘야하는지 로컬에서 처리해야하는지 당연히 서버일거같긴한데
    
    private let disposeBag = DisposeBag()
//    var closure: () -> Void
    
    var menuArray: [String] = []
    var kcalArray: [Int] = []//int로 바꾸기
    
    private let rightButton = UIButton(type: .system).then {
        $0.setTitle("완료", for: .normal)
        $0.setTitleColor(.gray800, for: .normal)
        $0.titleLabel?.font = .IBMPlexSansFont(font: .medium, ofSize: 14)
    }
    private let mainLogoImage = UIImageView(image: .logo)
    private let mealTimeLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 20)
    }
    private let addMenuLabel = UILabel().then {
        $0.text = "메뉴 추가하기"
        $0.textColor = .gray700
        $0.font = .IBMPlexSansFont(font: .medium, ofSize: 16)
    }
    private let addMenuButton = UIButton(type: .system).then {
        $0.setImage(.addIcon, for: .normal)
        $0.tintColor = .gray700
    }
    private let menuTextField = MenuTextField(placeholder: "메뉴 입력")
    private let kcalTextField = MenuTextField(placeholder: "칼로리 입력")
    private let menuTableView = UITableView().then {
        $0.backgroundColor = .white
        $0.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        $0.rowHeight = 48
        $0.separatorStyle = .none
    }
    
    public func setter(
        mealTime: String
    ) {
        self.mealTimeLabel.text = mealTime
    }
    
//    init(completion: @escaping () -> Void) {
//        self.completion = closure
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        navigationBarSetting()
    }
    override func configureUI() {
        super.configureUI()
        
        [
            mainLogoImage,
            mealTimeLabel,
            addMenuLabel,
            addMenuButton,
            menuTextField,
            kcalTextField,
            menuTableView
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
        mealTimeLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(15)
            $0.left.equalToSuperview().inset(20)
        }
        addMenuLabel.snp.makeConstraints {
            $0.top.equalTo(mealTimeLabel.snp.bottom).offset(28)
            $0.left.equalToSuperview().inset(20)
        }
        addMenuButton.snp.makeConstraints {
            $0.top.equalTo(mainLogoImage.snp.bottom).offset(75)
            $0.right.equalToSuperview().inset(20)
            $0.width.height.equalTo(30)
        }
        menuTextField.snp.makeConstraints {
            $0.top.equalTo(addMenuLabel.snp.bottom).offset(25)//강해민한테 물어보고 레이아웃 조정하기
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        kcalTextField.snp.makeConstraints {
            $0.top.equalTo(menuTextField.snp.bottom).offset(8)
            $0.left.right.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        menuTableView.snp.makeConstraints {
            $0.top.equalTo(kcalTextField.snp.bottom).offset(40)
            $0.left.right.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
    }
    override func subscribe() {
        super.subscribe()
        
        rightButton.rx.tap
            .bind(onNext: {
//                let vc = MenuViewController()
            }).disposed(by: disposeBag)
        
        addMenuButton.rx.tap
            .bind(onNext: {
                self.menuArray.append(self.menuTextField.text!)
//                self.kcalArray.append(self.kcalTextField.text!)
                self.menuTableView.reloadData()
            }).disposed(by: disposeBag)
        
        
    }
    
    func navigationBarSetting() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
}


extension DetailMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.selectionStyle = .none
        cell.menuLabel.text = self.menuArray[indexPath.row]
//        cell.kcalLabel.text = self.kcalArray[indexPath.row]
        cell.deleteButton.rx.tap
            .bind(onNext: {
                self.menuArray.remove(at: indexPath.row)
                self.kcalArray.remove(at: indexPath.row)
                self.menuTableView.reloadData()
            }).disposed(by: disposeBag)
        
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//            menuTableView.deleteRows(at: [indexPath], with: .automatic) 
        self.menuArray.remove(at: indexPath.row)
        self.kcalArray.remove(at: indexPath.row)
        menuTableView.reloadData()
    }
//    
}
