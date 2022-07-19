//
//  ViewController.swift
//  JustPlay
//
//  Created by Imran razak on 19/07/2022.
//

import UIKit
import AuthenticationServices
import Security

class LoginViewController: UIViewController {
    
    
    
    var StackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        configureStackView()
    }
    
    func configureStackView() {
        view.addSubview(StackView)
        StackView.axis = .vertical
        StackView.spacing = 20
        StackView.distribution = .fillProportionally
        
        //Header image
        let HeaderImage = UIImageView()
        HeaderImage.image = UIImage(named: "LoginDoodle")
        StackView.addArrangedSubview(HeaderImage)
        
        //Title Text
        let titleLabel = UILabel()
        titleLabel.text = "Welcome to JustPlay"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 20)
        StackView.addArrangedSubview(titleLabel)
        
        
        //Description Text
        let descriptionText =  UILabel()
        descriptionText.numberOfLines = 4
        descriptionText.text = "Music you love, easier to find, easier to enjoy. Connect Apple Music to start enjoying a simpler experience."
        descriptionText.textAlignment = .center
        StackView.addArrangedSubview(descriptionText)
        
        
        
        //Sign in With Apple Button
        setupProviderLoginView()
        
        
        //Privacy Label
        let privacylabel = UILabel()
        privacylabel.text = "We don’t track, sell or see your information. We only see the analytics Apple Provides."
        privacylabel.textAlignment = .center
        privacylabel.numberOfLines = 2
        StackView.addArrangedSubview(privacylabel)
        
        
        //Terms Button
        
        
        setStackViewConstraints()
        
        
    }
    
    func setStackViewConstraints() {
        StackView.translatesAutoresizingMaskIntoConstraints = false
        StackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero).isActive = true
        StackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        StackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        StackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
    }
    
    //Create Sign In with Apple Button
    func setupProviderLoginView() {
        let authorizationButton = ASAuthorizationAppleIDButton()
        authorizationButton.addTarget(self, action: #selector(handleLogInWithAppleID), for: .touchUpInside)
        StackView.addArrangedSubview(authorizationButton)
    }
    
    @objc func handleLogInWithAppleID() {
         let request = ASAuthorizationAppleIDProvider().createRequest()
         request.requestedScopes = [.fullName, .email]
         
         let controller = ASAuthorizationController(authorizationRequests: [request])
         
         controller.delegate = self
         controller.presentationContextProvider = self
         
         controller.performRequests()
     }

}


extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            // Create an account in your system.
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            
           //Save user information in Cloudkit
            
            
            let attributes: [String: Any] = [
                kSecClass as String: kSecClassInternetPassword,
                kSecAttrAccount as String: userIdentifier,
                
            ]
            
            
            

            // Add user
            if SecItemAdd(attributes as CFDictionary, nil) == noErr {
                print("User saved successfully in the keychain")
            } else {
                print("Something went wrong trying to save the user in the keychain")
            }
            
            
            //Retrieve Credentials on apps launch via Cloudkit
            
            
            //Send user to to AppleMusicConnect view controller after authentication
            
            
        
        case let passwordCredential as ASPasswordCredential:
        
            // Sign in using an existing iCloud Keychain credential.
            let username = passwordCredential.user
            let password = passwordCredential.password
            
            // For the purpose of this demo app, show the password credential as an alert.
            /*DispatchQueue.main.async {
                self.showPasswordCredentialAlert(username: username, password: password)
            }
            */
        default:
            break
        }
    }
}

    
extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
               return self.view.window!
        }
    }
