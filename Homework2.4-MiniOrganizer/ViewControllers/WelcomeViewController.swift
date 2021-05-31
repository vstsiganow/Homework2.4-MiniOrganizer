//
//  WelcomeViewController.swift
//  Homework2.3-AuthorizationScreen
//
//  Created by vtsyganov on 25.05.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    var welcomeUserName = ""
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //@IBOutlet weak var logoutButton: UIButton!
    
    // MARK: - View Load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer(topColor: .yellow, bottomColor: .blue)
        welcomeLabel.text = "Welcome, dear \(welcomeUserName)!"
    }
    
    // MARK: - IBActions
    @IBAction func tappedLogoutButton(_ sender: UIButton!) {
        dismiss(animated: true)
        welcomeUserName = ""
    }
    
}
