//
//  HomeViewController.swift
//  JustPlay
//
//  Created by Imran razak on 28/07/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    
     var collectionView: UICollectionView!
    
    private let titleView: UILabel = {
        let label = UILabel()
        return label
    }()
  
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Navigation Title
        view.addSubview(titleView)
        titleView.text = "Hello"
               
        // Do any additional setup after loading the view.
        
        
        //Layout Configruations
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset =  UIEdgeInsets (top: 0, left: 10, bottom: 30, right: 10)
        layout.itemSize = CGSize(width: 164, height: 157)
         

    
        
        //Configuring Collection View
        
        collectionView = UICollectionView(frame: view.bounds
                                          , collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.Identifier)
        collectionView.backgroundColor = .white
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.bounces = true
        collectionView.alwaysBounceVertical =  true
       
        view.addSubview(collectionView)
        
        
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.Identifier, for: indexPath) as! CollectionViewCell
       
        //Add Genre Text and background Image from Model
        //cell.backgroundColor = .systemBlue
        return cell
    }
    
    
    //StackView
    
    

}
