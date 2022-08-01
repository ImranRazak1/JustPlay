//
//  MiniPlayerView.swift
//  JustPlay
//
//  Created by Imran razak on 01/08/2022.
//

import UIKit

class MiniPlayerView: UICollectionViewCell {
    
    static let identifier =  "MiniPlayerView"
    
    let text = UILabel()
    let image =  UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.addSubview(text)
        backgroundColor = .gray
        text.text = "Hello"
        text.contentMode = .scaleAspectFill
        text.textAlignment = .center
        text.clipsToBounds = true
        
    }
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        text.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init(coder:NSCoder) {
        fatalError("Failed to load MiniPlayerView")
    }
    
}
