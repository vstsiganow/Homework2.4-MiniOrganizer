//
//  RegistrationViewController.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 29.05.2021.
//

import UIKit

class RegistrationViewController: UIViewController {

    var user = User()
    
    @IBOutlet weak var registrationUsername: UITextField!
    
    @IBOutlet weak var registrationEmail: UITextField!
    
    @IBOutlet weak var registrationPassword: UITextField!
    
    @IBOutlet weak var registrationPasswordAgain: UITextField!
    
    @IBOutlet weak var checkPasswordsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: .blue.withAlphaComponent(0.6), bottomColor: .red.withAlphaComponent(0.6))
        checkPasswordsLabel.isHidden = true
        user.loadListUsers()
        user.printItems()
    }
    
    
    @IBAction func tappedCreateAccountButton(_ sender: Any) {
        if checkFormStatus() {
            let account = Account(username: registrationUsername.text!, password: registrationPassword.text!, questionnaire: Questionnaire())
            user.addNewAccount(newAccount: account)
            dismiss(animated: true)
        }
    }
    
    @IBAction func tappedCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func checkFormStatus() -> Bool { //ToDo: Create correctly info abount errors
        if registrationUsername.text == "" {
            checkPasswordsLabel.text = "Username is empty. Please write username."
            checkPasswordsLabel.textColor = UIColor(red: 1, green: 98/255, blue: 47/255, alpha: 0.9)
            checkPasswordsLabel.isHidden = false
            return false
        } else if registrationPassword.text != registrationPasswordAgain.text || registrationPassword.text == "" {
            checkPasswordsLabel.text = "Incorrect passwords. Please write equal passwords."
            checkPasswordsLabel.textColor = UIColor(red: 1, green: 98/255, blue: 47/255, alpha: 0.9)
            checkPasswordsLabel.isHidden = false
            return false
        } else {
            return true
        }
    }
    
}
