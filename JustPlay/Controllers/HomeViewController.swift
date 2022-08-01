//
//  HomeViewController.swift
//  JustPlay
//
//  Created by Imran razak on 31/07/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView =  UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        collectionView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource =  self
        
        collectionView.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.identifier)
        collectionView.register(MiniPlayerView.self, forCellWithReuseIdentifier: MiniPlayerView.identifier)
        
        view.addSubview(collectionView)
    }

}

func createLayout() -> UICollectionViewCompositionalLayout {
    
    //item
    let item = NSCollectionLayoutItem(layoutSize:
                                        NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                               heightDimension: .absolute(157))
                                      )
    
    item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
    
    //group
                                      
    let group = NSCollectionLayoutGroup.horizontal (layoutSize:
                                                        NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                               heightDimension: .fractionalHeight(0.25)),
                                                    subitem: item,
                                                    count: 2)
    
    //section
    let section = NSCollectionLayoutSection(group: group)
    
    //return
    return UICollectionViewCompositionalLayout(section: section)
    
}

func miniPlayerLayout() -> UICollectionViewCompositionalLayout{
    
    //Item
    let item =  NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                                          heightDimension: .absolute(141)))
    
    
    //Group
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93),
                                                                                      heightDimension: .absolute(141)),
                                                   subitems: [item])
    
    //section
    let section = NSCollectionLayoutSection(group: group)
    
    //return
    return UICollectionViewCompositionalLayout(section: section)
    
    
}


extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let GenreCell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.identifier, for: indexPath)
        return GenreCell
        
    }
    
    
}
