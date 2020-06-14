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
    
    var numericValue: Int  {
        switch self {
        case .aceOfSpades,
             .aceOfDiamonds,
             .aceOfClubs,
             .aceOfHearts:
            return 1
            
        case .twoOfSpades,
             .twoOfDiamonds,
             .twoOfClubs,
             .twoOfHearts:
            return 2
            
        case .threeOfSpades,
             .threeOfDiamonds,
             .threeOfClubs,
             .threeOfHearts:
            return 3
            
        case .fourOfSpades,
             .fourOfDiamonds,
             .fourOfClubs,
             .fourOfHearts:
            return 4
            
        case .fiveOfSpades,
             .fiveOfDiamonds,
             .fiveOfClubs,
             .fiveOfHearts:
            return 5
            
        case .sixOfSpades,
             .sixOfDiamonds,
             .sixOfClubs,
             .sixOfHearts:
            return 6
        
        case .sevenOfSpades,
             .sevenOfDiamonds,
             .sevenOfClubs,
             .sevenOfHearts:
            return 7
            
        case .eightOfSpades,
             .eightOfDiamonds,
             .eightOfClubs,
             .eightOfHearts:
            return 8
            
        case .nineOfSpades,
             .nineOfDiamonds,
             .nineOfClubs,
             .nineOfHearts:
            return 9
            
        case .tenOfSpades,
             .tenOfDiamonds,
             .tenOfClubs,
             .tenOfHearts:
            return 10
            
        case .jackOfSpades,
             .jackOfDiamonds,
             .jackOfClubs,
             .jackOfHearts:
            return 11
            
        case .queenOfSpades,
             .queenOfDiamonds,
             .queenOfClubs,
             .queenOfHearts:
            return 12
            
        case .kingOfSpades,
             .kingOfDiamonds,
             .kingOfClubs,
             .kingOfHearts:
            return 13
        }
    }
    
    static func cardFor(value: Int, suit: SuitType) -> CardType? {
        guard value > 0 && value <= 13 else { return nil }
        switch (value, suit) {
        case (1, .hearts):
            return .aceOfHearts
            
        case (2, .hearts):
            return .twoOfHearts
            
        case (3, .hearts):
            return .threeOfHearts
        
        case (4, .hearts):
            return .fourOfHearts
        
        case (5, .hearts):
            return .fiveOfHearts
            
        case (6, .hearts):
            return .sixOfHearts
            
        case (7, .hearts):
            return .sevenOfHearts
        
        case (8, .hearts):
            return .eightOfHearts
        
        case (9, .hearts):
            return .nineOfHearts
        
        case (10, .hearts):
            return .tenOfHearts
        
        case (11, .hearts):
            return .jackOfHearts
            
        case (12, .hearts):
            return .queenOfHearts
            
        case (13, .hearts):
            return .kingOfHearts
            
            
        case (1, .spades):
            return .aceOfSpades
            
        case (2, .spades):
            return .twoOfSpades
            
        case (3, .spades):
            return .threeOfSpades
        
        case (4, .spades):
            return .fourOfSpades
        
        case (5, .spades):
            return .fiveOfSpades
            
        case (6, .spades):
            return .sixOfSpades
            
        case (7, .spades):
            return .sevenOfSpades
        
        case (8, .spades):
            return .eightOfSpades
        
        case (9, .spades):
            return .nineOfSpades
        
        case (10, .spades):
            return .tenOfSpades
        
        case (11, .spades):
            return .jackOfSpades
            
        case (12, .spades):
            return .queenOfSpades
            
        case (13, .spades):
            return .kingOfSpades
            
            
        case (1, .diamonds):
            return .aceOfDiamonds
            
        case (2, .diamonds):
            return .twoOfDiamonds
            
        case (3, .diamonds):
            return .threeOfDiamonds
        
        case (4, .diamonds):
            return .fourOfDiamonds
        
        case (5, .diamonds):
            return .fiveOfDiamonds
            
        case (6, .diamonds):
            return .sixOfDiamonds
            
        case (7, .diamonds):
            return .sevenOfDiamonds
        
        case (8, .diamonds):
            return .eightOfDiamonds
        
        case (9, .diamonds):
            return .nineOfDiamonds
        
        case (10, .diamonds):
            return .tenOfDiamonds
        
        case (11, .diamonds):
            return .jackOfDiamonds
            
        case (12, .diamonds):
            return .queenOfDiamonds
            
        case (13, .diamonds):
            return .kingOfDiamonds
            
            
        case (1, .clubs):
            return .aceOfClubs
            
        case (2, .clubs):
            return .twoOfClubs
            
        case (3, .clubs):
            return .threeOfClubs
        
        case (4, .clubs):
            return .fourOfClubs
        
        case (5, .clubs):
            return .fiveOfClubs
            
        case (6, .clubs):
            return .sixOfClubs
            
        case (7, .clubs):
            return .sevenOfClubs
        
        case (8, .clubs):
            return .eightOfClubs
        
        case (9, .clubs):
            return .nineOfClubs
        
        case (10, .clubs):
            return .tenOfClubs
        
        case (11, .clubs):
            return .jackOfClubs
            
        case (12, .clubs):
            return .queenOfClubs
            
        case (13, .clubs):
            return .kingOfClubs
            
            
        default:
            return nil
        }
        
    }
}



