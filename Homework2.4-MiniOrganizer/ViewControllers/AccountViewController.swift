//
//  QuestionnaireViewController.swift
//  Homework2.4-MiniOrganizer
//
//  Created by vtsyganov on 30.05.2021.
//

import UIKit

class AccountViewController: UIViewController {

    var account = Account(username: "", password: "", questionnaire: Questionnaire())
    
    @IBOutlet weak var fotoUIImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var middleNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var aboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: .yellow, bottomColor: .blue)
        usernameLabel.text = account.username
        emailLabel.text = account.email
        firstNameLabel.text = account.questionnaire?.firstName
        middleNameLabel.text = account.questionnaire?.middleName
        lastNameLabel.text = account.questionnaire?.lastName
        sexLabel.text = account.questionnaire?.sex.rawValue
        countryLabel.text = account.questionnaire?.country
        cityLabel.text = account.questionnaire?.city
        aboutLabel.text = account.questionnaire?.about
        //fotoUIImageView.image
    }
    


    // MARK: - Navigation


}
