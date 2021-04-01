//
//  ViewController.swift
//  HomeWork2.3
//
//  Created by Антон Вербицкий on 30.03.2021.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

	// MARK: - IB Outlets
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!

	@IBOutlet weak var loginButton: UIButton!

	@IBOutlet weak var forgotUsernameButton: UIButton!
	@IBOutlet weak var forgotPasswordButton: UIButton!

	// MARK: - Private Properties
	private let username = "Walter"
	private let password = "123"

	// MARK: - Override Methods
	override func viewDidLoad() {
		super.viewDidLoad()

		usernameTextField.delegate = self
		passwordTextField.delegate = self

	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		super.touchesBegan(touches, with: event)

		usernameTextField.resignFirstResponder()
		passwordTextField.resignFirstResponder()
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
		welcomeVC.welcomeTextLabel = "Give me five, \(username)!"
	}

	// MARK: - IB Actions
	@IBAction func loginButtonTapped() {
		if usernameTextField.text != username {
			showAlertUsernameAndClear()
		}
		if passwordTextField.text != password {
			showAlertPasswordAndClear()
		}
	}

	@IBAction func forgotUsernameTapped() {
		showAlertForgotUsername()
	}

	@IBAction func forgotPasswordTapped() {
		showAlertForgotPassword()
	}

	@IBAction func unwind(for segue: UIStoryboardSegue) {
		guard let _ = segue.source as? WelcomeViewController else { return }
		usernameTextField.text = nil
		passwordTextField.text = nil
	}

	// MARK: - Public Methods
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case usernameTextField:
			passwordTextField.becomeFirstResponder()
		case passwordTextField:
			textField.resignFirstResponder()
		default:
			textField.resignFirstResponder()
		}
		return true
	}

	// MARK: - Private Methods
	private func showAlertForgotUsername() {
		let alertUsername = UIAlertController(title: "Your username:",
											  message: username,
											  preferredStyle: .alert)
		alertUsername.addAction(UIAlertAction(title: "OK", style: .default))
		present(alertUsername, animated: true)
	}

	private func showAlertForgotPassword() {
		let alertPassword = UIAlertController(title: "Your password:",
											  message: password,
											  preferredStyle: .alert)
		alertPassword.addAction(UIAlertAction(title: "OK", style: .default))
		present(alertPassword, animated: true)
	}

	private func showAlertUsernameAndClear() {
		let alertLogin = UIAlertController(title: "You're wrong!",
										   message: "Please input correct Username",
										   preferredStyle: .alert)
		alertLogin.addAction(UIAlertAction(title: "OK", style: .destructive))
		present(alertLogin, animated: true)

		usernameTextField.text = nil
		passwordTextField.text = nil
	}

	private func showAlertPasswordAndClear() {
		let alertLogin = UIAlertController(title: "You're wrong!",
										   message: "Please input correct Password",
										   preferredStyle: .alert)
		alertLogin.addAction(UIAlertAction(title: "OK", style: .destructive))
		present(alertLogin, animated: true)

		passwordTextField.text = nil
	}


}

