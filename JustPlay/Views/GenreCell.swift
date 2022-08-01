//
//  GenreCell.swift
//  JustPlay
//
//  Created by Imran razak on 31/07/2022.
//

import UIKit

class GenreCell: UICollectionViewCell {
    
    static let identifier =  "GenreCell"
    
    let image = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(image)
        
        image.image = genres.randomElement()!
        image.layer.cornerRadius = 8
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        

        
      
    }
    
    let genres = [
        UIImage(named: "Chill"),
        UIImage(named: "FeelingBlue"),
        UIImage(named: "Fitness"),
        UIImage(named: "SummerSounds"),
        UIImage(named: "Pop"),
        UIImage(named: "Sleep")
    ]
    
    override func layoutSubviews() {
        super.layoutSubviews()
        image.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    
    required init(coder: NSCoder) {
       fatalError("Nothing is happening!")
    }
    
}
