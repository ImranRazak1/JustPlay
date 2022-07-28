//
//  HomeViewController.swift
//  JustPlay
//
//  Created by Imran razak on 28/07/2022.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    var collectionView = UICollectionView()

        
  

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        //Layout Configruations
        let layout = UICollectionViewFlowLayout()
        //layout.sectionInset =  UIEdgeInsets (top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: 164, height: 157)

    
        
        //Configuring Collection View
        //collectionView.translatesAutoresizingMaskIntoConstraints =  false
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.Identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        
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
        return cell
    }
    
    func configureCollectionView() {
        
    }

}
