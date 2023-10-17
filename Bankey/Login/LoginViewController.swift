//
//  ViewController.swift
//  Bankey
//
//  Created by Eng. Motlaq Alnassafi on 16/10/2023.
//

import UIKit

class LoginViewController: UIViewController {
    
    let headerLabel = UILabel()
    let subLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

extension LoginViewController {
    
    private func style() {
        
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.text = "Bankey"
        headerLabel.textAlignment = .center
        headerLabel.font = .boldSystemFont(ofSize: 48)
        
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.text = "Your premium source for all things banking!"
        subLabel.numberOfLines = 0
        subLabel.textAlignment = .center
        subLabel.font = .systemFont(ofSize: 20)
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.isHidden = true
        
    }
    
    private func layout() {
        view.addSubview(headerLabel)
        view.addSubview(subLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // HeaderLabel Constraint
        NSLayoutConstraint.activate([
            headerLabel.bottomAnchor.constraint(equalTo: subLabel.topAnchor,constant: -26),
            headerLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // SubLabel Constraint
        NSLayoutConstraint.activate([
            subLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -32),
            subLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            subLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // LoginView Constraint
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        //Button Constraint
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 16),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //ErrorLabel Constraint
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        errorMessageLabel.isHidden = true
        login()
        
    }
    
    private func login() {
        guard let username = username, let password = password else {
             /*
                developer assertion that only appears in debug builds - gets compiled out in production builds
                shoud never happen. But we add it sometimes as a check just in case.
             */
            assertionFailure("Username / password should never be  nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
            return
        }
        
        if username == "Motlaq" && password == "Alnesafi" {
            signInButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect username / password")
        }
    }
    
    private func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}


