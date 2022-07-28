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
        let layout =  UICollectionViewFlowLayout()
        layout.sectionInset =  UIEdgeInsets (top: .zero, left: .zero, bottom: .zero, right: .zero)
        layout.itemSize = CGSize(width: 164, height: 157)
        
        
        //Configuring Collection View
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.Identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .white
        
        view.addSubview(collectionView)
        
        
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.Identifier, for: indexPath) as! CollectionViewCell
        return cell
    }

}
