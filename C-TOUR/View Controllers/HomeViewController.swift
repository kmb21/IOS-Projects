//
//  HomeViewController.swift
//  C-Tour
//
//  Created by Maxwell Kumbong on 4/19/23.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    private var posts = [Post]() {
        didSet {
            // Reload table view data any time the posts variable gets updated.
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        queryPosts()
    }

    private func queryPosts() {
        // TODO: Pt 1 - Query Posts
        let query = Post.query()
            .include("user")
            .order([.descending("createdAt")])

        // Fetch objects (posts) defined in query (async)
        query.find { [weak self] result in
            switch result {
            case .success(let posts):
                // Update local posts property with fetched posts
                self?.posts = posts
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }


    }

    @IBAction func onLogOutTapped(_ sender: Any) {
        showConfirmLogoutAlert()
    }
    
    private func showConfirmLogoutAlert() {
        let alertController = UIAlertController(title: "Log out of your account?", message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(logOutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.configure(with: posts[indexPath.row])
        return cell
    }
}

extension HomeViewController: UITableViewDelegate { }
