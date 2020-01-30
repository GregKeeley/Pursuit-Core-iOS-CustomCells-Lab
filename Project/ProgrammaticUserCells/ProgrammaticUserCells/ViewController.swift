import UIKit

class ViewController: UIViewController {

    private var randomUsers = [User]()
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        getUsers()
    }
    private func getUsers() {
        UsersFetchingService.manager.getUsers { (results) in
            switch results {
            case .failure(let appError):
                print("Failed to retrieve randomUsers: \(appError)")
            case .success(let userData):
                self.randomUsers = userData
            }
        }
    }
    
}
extension ViewController: UICollectionViewDelegate {

}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomUsers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("Failed to donwcast as user cell")
        }
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
}
