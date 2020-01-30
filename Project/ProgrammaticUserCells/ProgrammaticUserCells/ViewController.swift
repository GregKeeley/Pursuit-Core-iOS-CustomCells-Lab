import UIKit

class ViewController: UIViewController {

    private var randomUsers = [User]() {
        didSet {
            DispatchQueue.main.async {
                self.mainView.collectionView.reloadData()
            }
        }
    }
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(UINib(nibName: "UserCell", bundle: nil), forCellWithReuseIdentifier: "userCell")
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
        let user = randomUsers[indexPath.row]
        cell.userNameLabel.text = user.login.username
        cell.titleAndNameLabel.text = ("\(user.name.title) \(user.name.first) \(user.name.last)")
        cell.ageLabel.text = ("Age: \(user.dob.age.description)")
        cell.cityAndStateLabel.text = ("\(user.location.city), \(user.location.state)")
        return cell
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let itemWidth:CGFloat = maxSize.width * 0.95
        return CGSize(width: itemWidth, height: itemWidth / 3)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let user = randomUsers[indexPath.row]
        let userDetailVC = UserDetailViewController()
        userDetailVC.user = user
        navigationController?.pushViewController(userDetailVC, animated: true)
    }
}
