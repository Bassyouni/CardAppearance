//
//  CardType.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 6/13/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import Foundation

enum CardType: CaseIterable {
    case aceOfSpades
    case aceOfDiamonds
    case aceOfClubs
    case aceOfHearts
    case twoOfSpades
    case twoOfDiamonds
    case twoOfClubs
    case twoOfHearts
    case threeOfSpades
    case threeOfDiamonds
    case threeOfClubs
    case threeOfHearts
    case fourOfSpades
    case fourOfDiamonds
    case fourOfClubs
    case fourOfHearts
    case fiveOfSpades
    case fiveOfDiamonds
    case fiveOfClubs
    case fiveOfHearts
    case sixOfSpades
    case sixOfDiamonds
    case sixOfClubs
    case sixOfHearts
    case sevenOfSpades
    case sevenOfDiamonds
    case sevenOfClubs
    case sevenOfHearts
    case eightOfSpades
    case eightOfDiamonds
    case eightOfClubs
    case eightOfHearts
    case nineOfSpades
    case nineOfDiamonds
    case nineOfClubs
    case nineOfHearts
    case tenOfSpades
    case tenOfDiamonds
    case tenOfClubs
    case tenOfHearts
    case jackOfSpades
    case jackOfDiamonds
    case jackOfClubs
    case jackOfHearts
    case queenOfSpades
    case queenOfDiamonds
    case queenOfClubs
    case queenOfHearts
    case kingOfSpades
    case kingOfDiamonds
    case kingOfClubs
    case kingOfHearts
    
    var imageName: String {
        switch self {
        case .aceOfSpades: return "AS"
        case .aceOfDiamonds: return "AD"
        case .aceOfClubs: return "AC"
        case .aceOfHearts: return "AH"
        case .twoOfSpades: return "2S"
        case .twoOfDiamonds: return "2D"
        case .twoOfClubs: return "2C"
        case .twoOfHearts: return "2H"
        case .threeOfSpades: return "3S"
        case .threeOfDiamonds: return "3D"
        case .threeOfClubs: return "3C"
        case .threeOfHearts: return "3H"
        case .fourOfSpades: return "4S"
        case .fourOfDiamonds: return "4D"
        case .fourOfClubs: return "4C"
        case .fourOfHearts: return "4H"
        case .fiveOfSpades: return "5S"
        case .fiveOfDiamonds: return "5D"
        case .fiveOfClubs: return "5C"
        case .fiveOfHearts: return "5H"
        case .sixOfSpades: return "6S"
        case .sixOfDiamonds: return "6D"
        case .sixOfClubs: return "6C"
        case .sixOfHearts: return "6H"
        case .sevenOfSpades: return "7S"
        case .sevenOfDiamonds: return "7D"
        case .sevenOfClubs: return "7C"
        case .sevenOfHearts: return "7H"
        case .eightOfSpades: return "8S"
        case .eightOfDiamonds: return "8D"
        case .eightOfClubs: return "8C"
        case .eightOfHearts: return "8H"
        case .nineOfSpades: return "9S"
        case .nineOfDiamonds: return "9D"
        case .nineOfClubs: return "9C"
        case .nineOfHearts: return "9H"
        case .tenOfSpades: return "10S"
        case .tenOfDiamonds: return "10D"
        case .tenOfClubs: return "10C"
        case .tenOfHearts: return "10H"
        case .jackOfSpades: return "JS"
        case .jackOfDiamonds: return "JD"
        case .jackOfClubs: return "JC"
        case .jackOfHearts: return "JH"
        case .queenOfSpades: return "QS"
        case .queenOfDiamonds: return "QD"
        case .queenOfClubs: return "QC"
        case .queenOfHearts: return "QH"
        case .kingOfSpades: return "KS"
        case .kingOfDiamonds: return "KD"
        case .kingOfClubs: return "KC"
        case .kingOfHearts: return "KH"
        }
    }
}



