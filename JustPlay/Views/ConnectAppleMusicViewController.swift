//
//  ConnectAppleMusicViewController.swift
//  JustPlay
//
//  Created by Imran razak on 20/07/2022.
//

import UIKit
import MusicKit

class ConnectAppleMusicViewController: UIViewController {
    
    var StackView = UIStackView()
    var isAuthorizedForMusicKit = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureStackView()
        configureRequestButton()
    }
    
    
    
    func configureRequestButton() {
        let button = UIButton()
        button.setTitle("Test", for: .normal)
        button.setTitleColor(.systemBlue,for: .normal)
        button.addTarget(self,
                         action: #selector(requestMusicAuthorization),
                         
                         for: .touchUpInside)
        StackView.addArrangedSubview(button)
    }
    

    
    @objc func requestMusicAuthorization() async throws {
        
        let authorizationStatus = await MusicAuthorization.request()
        if authorizationStatus == .authorized {
            isAuthorizedForMusicKit = true
        } else {
            // User denied permission.
        }
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
        
        //Connect Music Text
        let titleLabel = UILabel()
        titleLabel.text = "Connect to Apple Music"
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 20)
        StackView.addArrangedSubview(titleLabel)
        
        
        //Description Text
        let descriptionText =  UILabel()
        descriptionText.numberOfLines = 4
        descriptionText.text = "In-order to use the app we need you to connect to Apple music so we can sync your music and explore new music."
        descriptionText.textAlignment = .center
        StackView.addArrangedSubview(descriptionText)
        
        //Connect to Apple music Button
        
        
        setStackViewConstraints()
    }
    
    
    func setStackViewConstraints() {
        StackView.translatesAutoresizingMaskIntoConstraints = false
        StackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: .zero).isActive = true
        StackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        StackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        StackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50).isActive = true
        
    }
   
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

