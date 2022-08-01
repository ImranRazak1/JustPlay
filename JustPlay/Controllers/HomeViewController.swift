//
//  HomeViewController.swift
//  JustPlay
//
//  Created by Imran razak on 31/07/2022.
//

import UIKit
import MusicKit

class HomeViewController: UIViewController {
    
    enum Section: Int, Hashable, CaseIterable, CustomStringConvertible {
        case header, miniPlayer, genres
        
        var description: String {
            switch self {
            case .header: return "Header"
            case .miniPlayer: return "MiniPlayer"
            case .genres: return "Genres"
            }
        }
    }
    
    struct Item: Hashable {
        let artwork: UIImageView
        let text: String?
        init(artwork: UIImageView, text: String?) {
            self.artwork = artwork
            self.text = text
        }
        private let identifier = UUID()
    }
    
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Item>!
    

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





/*
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

*/
extension HomeViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let GenreCell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreCell.identifier, for: indexPath)
        return GenreCell
        
    }
    
    func createLayout() -> UICollectionViewLayout {
        
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
            
            let section: NSCollectionLayoutSection
            
            // orthogonal scrolling section of images
            if sectionKind == .header {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.28), heightDimension: .fractionalWidth(0.2))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 10
                section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
                section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
                
            // outline
            } else if sectionKind == .miniPlayer {
                //setup layout

            // list
            } else if sectionKind == .genres {
                
                //setup layout
        
                } else {
                fatalError("Unknown section!")
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    func createGridCellRegistration() -> UICollectionView.CellRegistration<UICollectionViewCell, Genres> {
        return UICollectionView.CellRegistration<UICollectionViewCell, Genres> { (cell, indexPath, Genres) in
            var content = UIListContentConfiguration.cell()
            content.text = Genres.title
            content.image = Genres.artwork
            content.textProperties.font = .boldSystemFont(ofSize: 38)
            content.textProperties.alignment = .center
            content.directionalLayoutMargins = .zero
            cell.contentConfiguration = content
            var background = UIBackgroundConfiguration.listPlainCell()
            background.cornerRadius = 8
            background.strokeColor = .systemGray3
            background.strokeWidth = 1.0 / cell.traitCollection.displayScale
            cell.backgroundConfiguration = background
        }
    }
    
    
}
