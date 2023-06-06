//
//  SignUpViewController.swift
//  C-Tour
//
//  Created by Salma Aly on 4/15/23.
//

import UIKit
import ParseSwift

class SignUpViewController: UIViewController {

    @IBOutlet weak var EmailAddressTextField: UITextField!
    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var SignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onSignUpTapped(_ sender: Any) {
        // Make sure all fields are non-nil and non-empty.
        guard let username = UsernameTextField.text,
              let email = EmailAddressTextField.text,
              let password = PasswordTextField.text,
              !username.isEmpty,
              !email.isEmpty,
              !password.isEmpty else {

            showMissingFieldsAlert()
            return
        }

        // Parse user sign up
        var newUser = User()
        newUser.username = username
        newUser.email = email
        newUser.password = password

        newUser.signup { [weak self] result in

            switch result {
            case .success(let user):

                print("✅ Successfully signed up user \(user)")

                // Post a notification that the user has successfully signed up.
                NotificationCenter.default.post(name: Notification.Name("login"), object: nil)

            case .failure(let error):
                // Failed sign up
                self?.showAlert(description: error.localizedDescription)
            }
        }
    }
    
    private func showMissingFieldsAlert() {
        let alertController = UIAlertController(title: "Opps...", message: "We need all fields filled out in order to sign you up.", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
