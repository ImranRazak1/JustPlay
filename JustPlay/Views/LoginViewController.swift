//
//  ViewController.swift
//  JustPlay
//
//  Created by Imran razak on 19/07/2022.
//

import UIKit

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
        //StackView.spacing = 20
        StackView.distribution = .fillEqually
        
        let HeaderImage = UIImageView()
        HeaderImage.image = UIImage(named: "LoginDoodle")
        StackView.addArrangedSubview(HeaderImage)
        
        
        let titleLabel = UILabel()
        titleLabel.text = "Welcome to JustPlay"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 20)
        StackView.addArrangedSubview(titleLabel)
        
        let descriptionText =  UILabel()
        descriptionText.numberOfLines = 4
        descriptionText.text = "Music you love, easier to find, easier to enjoy. Connect Apple Music to start enjoying a simpler experience."
        descriptionText.textAlignment = .center
        StackView.addArrangedSubview(descriptionText)
        
        setStackViewConstraints()
        
        
    }
    
    func setStackViewConstraints() {
        StackView.translatesAutoresizingMaskIntoConstraints = false
        StackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        StackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        StackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 20).isActive = true
        StackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
        
    }
    
    


}

