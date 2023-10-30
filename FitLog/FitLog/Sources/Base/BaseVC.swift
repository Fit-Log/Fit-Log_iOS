import UIKit
import SnapKit
import Then

class BaseVC: UIViewController, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.hidesBackButton = false
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
    override func viewWillLayoutSubviews() {
        
        configureUI()
        setupConstraints()
    }
    
    func configureUI() {
        
    }
    func setupConstraints() {
        
    }
    
}
