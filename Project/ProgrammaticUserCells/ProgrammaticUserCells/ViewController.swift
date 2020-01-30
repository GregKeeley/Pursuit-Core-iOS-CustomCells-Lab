import UIKit

class ViewController: UIViewController {

    private let randomUsers = [User]()
    
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
    }


}

