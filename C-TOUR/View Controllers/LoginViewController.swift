//
//  LoginViewController.swift
//  C-Tour
//
//  Created by Maxwell Kumbong on 4/14/23.
//

import UIKit
import ParseSwift

class LoginViewController: UIViewController {

    @IBOutlet weak var NoAccountLabel: UILabel!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var UserNameTextField: UITextField!
    @IBOutlet weak var LogindescriptionLabel: UILabel!
    @IBOutlet weak var WelcomeLabel: UILabel!
    @IBOutlet weak var AppNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func LoginButton(_ sender: Any) {
        // Make sure all fields are non-nil and non-empty.
        guard let username = UserNameTextField.text,
              let password = PasswordTextField.text,
              !username.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }
        
        // login user
        User.login(username: username, password: password) { [weak self] result in

            switch result {
            case .success(let user):
                print("✅ Successfully logged in as user: \(user)")

                // Post a notification that the user has successfully logged in.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                // Show an alert for any errors
                self?.showAlert(description: error.localizedDescription)
            }
        }
    }
    
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to log you in.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
    }

}
