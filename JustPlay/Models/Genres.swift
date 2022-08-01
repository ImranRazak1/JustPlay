//
//  Genres.swift
//  JustPlay
//
//  Created by Imran razak on 01/08/2022.
//

import Foundation
import UIKit

struct Genres: Hashable {

    enum Category: CaseIterable, CustomStringConvertible {
        case Pop, FeelingBlue, Sleep, Fitness, SummerSounds, Chills
    }
    let title: String
    let artwork: UIImage
    let category: Category
    private let identifier = UUID()
}

extension Genres.Category {
    
    var description: String {
        switch self {
        case .Pop: return "Pop"
        case .FeelingBlue: return "Feeling Blue"
        case .Sleep: return "Sleep"
        case .Fitness: return "Fitness"
        case .SummerSounds: return "Summer Sounds"
        case .Chills: return "Chills"
        }
    }
    
    var genres: [Genres] {
        switch self {
        case .Pop:
            return [
                Genres(title: "Pop", artwork: UIImage(named: "Pop")!, category: self)
            ]

        case .FeelingBlue:
            return [
                Genres(title: "Feeling Blue", artwork: UIImage(named: "FeelingBlue")!, category: self)
            ]
            
        case .Sleep:
            return [
                Genres(title: "Sleep", artwork: UIImage(named: "Sleep")!, category: self)
            ]
            
        case .Fitness:
            return [
                Genres(title: "Fitness", artwork: UIImage(named: "Fitness")!, category: self)
            ]

        case .SummerSounds:
            return [
            Genres(title: "Summer Sounds", artwork: UIImage(named: "SummerSounds")!, category: self)
            
            ]
        case .Chills:
            return [
            Genres(title: "Chills", artwork: UIImage(named: "Chills")!, category: self)
            
            ]
        }
    }
}
