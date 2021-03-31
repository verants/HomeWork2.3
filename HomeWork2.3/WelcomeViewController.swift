//
//  WelcomeViewController.swift
//  HomeWork2.3
//
//  Created by Антон Вербицкий on 31.03.2021.
//

import UIKit

class WelcomeViewController: UIViewController {

	@IBOutlet weak var welcomeLabel: UILabel!

	@IBOutlet weak var logoutButton: UIButton!

	var welcomeTextLabel: String!


    override func viewDidLoad() {
        super.viewDidLoad()


		welcomeLabel.text = welcomeTextLabel

    }

	@IBAction func logoutButtonTapped() {

	}

}
