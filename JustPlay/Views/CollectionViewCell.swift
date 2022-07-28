//
//  CollectionViewCell.swift
//  JustPlay
//
//  Created by Imran razak on 28/07/2022.
//

import UIKit
import MusicKit

class CollectionViewCell: UICollectionViewCell {
    
    static let Identifier = "CollectionViewCell"


    private let label: UILabel = {
        let label = UILabel()
        label.clipsToBounds = true
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds =  true
        return image
    }()
    
    
    let genres = ["Chill", "Party", "Focus", "Sleep", "Fitness", "Feel Good", "Commuting", "Feeling Blue"]

    let images = [
        UIImage(named: "Chill"),
        UIImage(named: "Party"),
        UIImage(named: "Focus"),
        UIImage(named: "Sleep"),
        UIImage(named: "Fitness"),
        UIImage(named: "FeelGood"),
        UIImage(named: "Communting"),
        UIImage(named: "FeelingBlue")
    ].compactMap({$0})
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
        label.text = genres.randomElement()
        imageView.image = images.randomElement()
    }
    
    required init?(coder: NSCoder) {
        
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
        label.textAlignment = .center
        imageView.frame = contentView.bounds
        
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    /*CollectionViewCell UI Components
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
     
     */
    
    
    //MARK: background Configruations

    
}


