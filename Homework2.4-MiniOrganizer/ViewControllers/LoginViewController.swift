//
//  ViewController.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 24.05.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let users = User()
    
    var account = Account(username: "", password: "", questionnaire: Questionnaire())
        
    // MARK: - IB Outlets
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Private properties
    private var registratedUserName = ""
    private var registratedPassword = ""
    
    // MARK: IBActions
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        loginTextField.text = ""
        passwordTextField.text = ""
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
            ? showAlert(title: "Oops!", message: "Your name is \(registratedUserName) 😉")
            : showAlert(title: "Oops!", message: "Your password is \(registratedPassword) 😉")
    }
    
    @IBAction func logInButtonPressed() {
        if loginCheck() {
            if loginTextField.text != account.username || passwordTextField.text != account.password {
                showAlert(
                    title: "Incorrect login or password",
                    message: "Please, enter correct login and password",
                    textField: passwordTextField
                )
                return
            }
        } else {
            return
        }
    }
    
    // MARK: - Private Methods
    private func loginCheck() -> Bool {
        if let loginUsername = loginTextField.text {
            if let index = users.findUsernameIndex(loginUsername) {
                account = users.users[index]
                return true
            } else {
                showAlert(
                    title: "Unknown user",
                    message: "Please, enter correct login or sing up",
                    textField: passwordTextField
                )
                return false
            }
        }
        return false
        
    }
    
    // MARK: - View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: .green.withAlphaComponent(0.8), bottomColor: .red.withAlphaComponent(0.9))
        users.loadListUsers()
        view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        users.loadListUsers()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //guard let tabBarController = segue.destination as? UITabBarController else { return }
        
        let tabBarController = segue.destination as? UITabBarController
        
        guard let viewControllers = tabBarController?.viewControllers else { return }

        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.welcomeUserName = account.username
            } else if let navigationVC = viewController as? UINavigationController {
                if let accountVC = navigationVC.topViewController as? AccountViewController {
                    accountVC.account = account
                }
            }
        }

    }
    
}

// MARK: - Private Extension Methods

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Alert Controller
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButtonPressed()
            //performSegue(withIdentifier: "goToAccount", sender: nil)
        }
        return true
    }
}
