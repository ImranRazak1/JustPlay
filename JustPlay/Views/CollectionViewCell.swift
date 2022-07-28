//
//  CollectionViewCell.swift
//  JustPlay
//
//  Created by Imran razak on 28/07/2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let Identifier = "CollectionViewCell"
    
   // let genres: [String] = ["Chill", "Party", "Focus", "Sleep", "Fitness", "Feel Good", "Commuting", "Feeling Blue"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    //CollectionViewCell UI Components
    private let ChillGenre: UILabel = {
        let genreText =  UILabel()
        genreText.text = "Chill"
        genreText.textColor = .systemBlue
        return genreText
    }()
    
    
    private let FeelGoodGenre: UILabel = {
        let genreText =  UILabel()
        genreText.text = "Feel Good"
        genreText.textColor = .systemBlue
        return genreText
    }()
    
    
    private let FitnessGenre: UILabel = {
        let genreText =  UILabel()
        genreText.text = "Fitness"
        genreText.textColor = .systemBlue
        return genreText
    }()
    
    
    private let FeelingBlueGenre: UILabel = {
        let genreText =  UILabel()
        genreText.text = "Feeling Blue"
        genreText.textColor = .systemBlue
        return genreText
    }()
    
    
    private let PartyGenre: UILabel = {
        let genreText =  UILabel()
        genreText.text = "Party"
        genreText.textColor = .systemBlue
        return genreText
    }()
    
    private let SleepGenre: UILabel = {
        let genreText =  UILabel()
        genreText.text = "Sleep Genre"
        genreText.textColor = .systemBlue
        genreText.translatesAutoresizingMaskIntoConstraints = false
        return genreText
    }()
    
    
    //MARK: background Configruations

    
}


