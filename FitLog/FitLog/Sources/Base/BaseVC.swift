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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
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
