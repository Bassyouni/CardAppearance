//
//  CardTypeTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 6/13/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class CardTypeTests: XCTestCase {
    
    // MARK: - Card image tests
    func testCardType_imageNameIsCorrect() {
        let allCardTypes = CardType.allCases
        
        for sut in allCardTypes {
            switch sut {
            case .aceOfSpades:
                XCTAssertEqual(sut.imageName, "AS", "\(String(describing: sut)) image name is incorrect")
            case .aceOfDiamonds:
                XCTAssertEqual(sut.imageName, "AD", "\(String(describing: sut)) image name is incorrect")
            case .aceOfClubs:
                XCTAssertEqual(sut.imageName, "AC", "\(String(describing: sut)) image name is incorrect")
            case .aceOfHearts:
                XCTAssertEqual(sut.imageName, "AH", "\(String(describing: sut)) image name is incorrect")
            case .twoOfSpades:
                XCTAssertEqual(sut.imageName, "2S", "\(String(describing: sut)) image name is incorrect")
            case .twoOfDiamonds:
                XCTAssertEqual(sut.imageName, "2D", "\(String(describing: sut)) image name is incorrect")
            case .twoOfClubs:
                XCTAssertEqual(sut.imageName, "2C", "\(String(describing: sut)) image name is incorrect")
            case .twoOfHearts:
                XCTAssertEqual(sut.imageName, "2H", "\(String(describing: sut)) image name is incorrect")
            case .threeOfSpades:
                XCTAssertEqual(sut.imageName, "3S", "\(String(describing: sut)) image name is incorrect")
            case .threeOfDiamonds:
                XCTAssertEqual(sut.imageName, "3D", "\(String(describing: sut)) image name is incorrect")
            case .threeOfClubs:
                XCTAssertEqual(sut.imageName, "3C", "\(String(describing: sut)) image name is incorrect")
            case .threeOfHearts:
                XCTAssertEqual(sut.imageName, "3H", "\(String(describing: sut)) image name is incorrect")
            case .fourOfSpades:
                XCTAssertEqual(sut.imageName, "4S", "\(String(describing: sut)) image name is incorrect")
            case .fourOfDiamonds:
                XCTAssertEqual(sut.imageName, "4D", "\(String(describing: sut)) image name is incorrect")
            case .fourOfClubs:
                XCTAssertEqual(sut.imageName, "4C", "\(String(describing: sut)) image name is incorrect")
            case .fourOfHearts:
                XCTAssertEqual(sut.imageName, "4H", "\(String(describing: sut)) image name is incorrect")
            case .fiveOfSpades:
                XCTAssertEqual(sut.imageName, "5S", "\(String(describing: sut)) image name is incorrect")
            case .fiveOfDiamonds:
                XCTAssertEqual(sut.imageName, "5D", "\(String(describing: sut)) image name is incorrect")
            case .fiveOfClubs:
                XCTAssertEqual(sut.imageName, "5C", "\(String(describing: sut)) image name is incorrect")
            case .fiveOfHearts:
                XCTAssertEqual(sut.imageName, "5H", "\(String(describing: sut)) image name is incorrect")
            case .sixOfSpades:
                XCTAssertEqual(sut.imageName, "6S", "\(String(describing: sut)) image name is incorrect")
            case .sixOfDiamonds:
                XCTAssertEqual(sut.imageName, "6D", "\(String(describing: sut)) image name is incorrect")
            case .sixOfClubs:
                XCTAssertEqual(sut.imageName, "6C", "\(String(describing: sut)) image name is incorrect")
            case .sixOfHearts:
                XCTAssertEqual(sut.imageName, "6H", "\(String(describing: sut)) image name is incorrect")
            case .sevenOfSpades:
                XCTAssertEqual(sut.imageName, "7S", "\(String(describing: sut)) image name is incorrect")
            case .sevenOfDiamonds:
                XCTAssertEqual(sut.imageName, "7D", "\(String(describing: sut)) image name is incorrect")
            case .sevenOfClubs:
                XCTAssertEqual(sut.imageName, "7C", "\(String(describing: sut)) image name is incorrect")
            case .sevenOfHearts:
                XCTAssertEqual(sut.imageName, "7H", "\(String(describing: sut)) image name is incorrect")
            case .eightOfSpades:
                XCTAssertEqual(sut.imageName, "8S", "\(String(describing: sut)) image name is incorrect")
            case .eightOfDiamonds:
                XCTAssertEqual(sut.imageName, "8D", "\(String(describing: sut)) image name is incorrect")
            case .eightOfClubs:
                XCTAssertEqual(sut.imageName, "8C", "\(String(describing: sut)) image name is incorrect")
            case .eightOfHearts:
                XCTAssertEqual(sut.imageName, "8H", "\(String(describing: sut)) image name is incorrect")
            case .nineOfSpades:
                XCTAssertEqual(sut.imageName, "9S", "\(String(describing: sut)) image name is incorrect")
            case .nineOfDiamonds:
                XCTAssertEqual(sut.imageName, "9D", "\(String(describing: sut)) image name is incorrect")
            case .nineOfClubs:
                XCTAssertEqual(sut.imageName, "9C", "\(String(describing: sut)) image name is incorrect")
            case .nineOfHearts:
                XCTAssertEqual(sut.imageName, "9H", "\(String(describing: sut)) image name is incorrect")
            case .tenOfSpades:
                XCTAssertEqual(sut.imageName, "10S", "\(String(describing: sut)) image name is incorrect")
            case .tenOfDiamonds:
                XCTAssertEqual(sut.imageName, "10D", "\(String(describing: sut)) image name is incorrect")
            case .tenOfClubs:
                XCTAssertEqual(sut.imageName, "10C", "\(String(describing: sut)) image name is incorrect")
            case .tenOfHearts:
                XCTAssertEqual(sut.imageName, "10H", "\(String(describing: sut)) image name is incorrect")
            case .jackOfSpades:
                XCTAssertEqual(sut.imageName, "JS", "\(String(describing: sut)) image name is incorrect")
            case .jackOfDiamonds:
                XCTAssertEqual(sut.imageName, "JD", "\(String(describing: sut)) image name is incorrect")
            case .jackOfClubs:
                XCTAssertEqual(sut.imageName, "JC", "\(String(describing: sut)) image name is incorrect")
            case .jackOfHearts:
                XCTAssertEqual(sut.imageName, "JH", "\(String(describing: sut)) image name is incorrect")
            case .queenOfSpades:
                XCTAssertEqual(sut.imageName, "QS", "\(String(describing: sut)) image name is incorrect")
            case .queenOfDiamonds:
                XCTAssertEqual(sut.imageName, "QD", "\(String(describing: sut)) image name is incorrect")
            case .queenOfClubs:
                XCTAssertEqual(sut.imageName, "QC", "\(String(describing: sut)) image name is incorrect")
            case .queenOfHearts:
                XCTAssertEqual(sut.imageName, "QH", "\(String(describing: sut)) image name is incorrect")
            case .kingOfSpades:
                XCTAssertEqual(sut.imageName, "KS", "\(String(describing: sut)) image name is incorrect")
            case .kingOfDiamonds:
                XCTAssertEqual(sut.imageName, "KD", "\(String(describing: sut)) image name is incorrect")
            case .kingOfClubs:
                XCTAssertEqual(sut.imageName, "KC", "\(String(describing: sut)) image name is incorrect")
            case .kingOfHearts:
                XCTAssertEqual(sut.imageName, "KH", "\(String(describing: sut)) image name is incorrect")
            case .blueBack:
                XCTAssertEqual(sut.imageName, "back_blue", "\(String(describing: sut)) image name is incorrect")
            }
        }
    }
    
    func testCardType_whenCardImageInstantiated_imageIsNotNil() {
        let allCardTypes = CardType.allCases
        for sut in allCardTypes {
            XCTAssertNotNil(UIImage(named: sut.imageName), "\(String(describing: sut)) image is nil")
        }
    }
    
    // MARK: - Card numeric value tests
    func testCardType_numericValueIsCorrect() {
        let allCardTypes = CardType.allCases
        
        for sut in allCardTypes {
            switch sut {
            case .aceOfSpades:
                XCTAssertEqual(sut.numericValue, 1, "\(String(describing: sut)) numeric value is incorrect")
            case .aceOfDiamonds:
                XCTAssertEqual(sut.numericValue, 1, "\(String(describing: sut)) numeric value is incorrect")
            case .aceOfClubs:
                XCTAssertEqual(sut.numericValue, 1, "\(String(describing: sut)) numeric value is incorrect")
            case .aceOfHearts:
                XCTAssertEqual(sut.numericValue, 1, "\(String(describing: sut)) numeric value is incorrect")
            case .twoOfSpades:
                XCTAssertEqual(sut.numericValue, 2, "\(String(describing: sut)) numeric value is incorrect")
            case .twoOfDiamonds:
                XCTAssertEqual(sut.numericValue, 2, "\(String(describing: sut)) numeric value is incorrect")
            case .twoOfClubs:
                XCTAssertEqual(sut.numericValue, 2, "\(String(describing: sut)) numeric value is incorrect")
            case .twoOfHearts:
                XCTAssertEqual(sut.numericValue, 2, "\(String(describing: sut)) numeric value is incorrect")
            case .threeOfSpades:
                XCTAssertEqual(sut.numericValue, 3, "\(String(describing: sut)) numeric value is incorrect")
            case .threeOfDiamonds:
                XCTAssertEqual(sut.numericValue, 3, "\(String(describing: sut)) numeric value is incorrect")
            case .threeOfClubs:
                XCTAssertEqual(sut.numericValue, 3, "\(String(describing: sut)) numeric value is incorrect")
            case .threeOfHearts:
                XCTAssertEqual(sut.numericValue, 3, "\(String(describing: sut)) numeric value is incorrect")
            case .fourOfSpades:
                XCTAssertEqual(sut.numericValue, 4, "\(String(describing: sut)) numeric value is incorrect")
            case .fourOfDiamonds:
                XCTAssertEqual(sut.numericValue, 4, "\(String(describing: sut)) numeric value is incorrect")
            case .fourOfClubs:
                XCTAssertEqual(sut.numericValue, 4, "\(String(describing: sut)) numeric value is incorrect")
            case .fourOfHearts:
                XCTAssertEqual(sut.numericValue, 4, "\(String(describing: sut)) numeric value is incorrect")
            case .fiveOfSpades:
                XCTAssertEqual(sut.numericValue, 5, "\(String(describing: sut)) numeric value is incorrect")
            case .fiveOfDiamonds:
                XCTAssertEqual(sut.numericValue, 5, "\(String(describing: sut)) numeric value is incorrect")
            case .fiveOfClubs:
                XCTAssertEqual(sut.numericValue, 5, "\(String(describing: sut)) numeric value is incorrect")
            case .fiveOfHearts:
                XCTAssertEqual(sut.numericValue, 5, "\(String(describing: sut)) numeric value is incorrect")
            case .sixOfSpades:
                XCTAssertEqual(sut.numericValue, 6, "\(String(describing: sut)) numeric value is incorrect")
            case .sixOfDiamonds:
                XCTAssertEqual(sut.numericValue, 6, "\(String(describing: sut)) numeric value is incorrect")
            case .sixOfClubs:
                XCTAssertEqual(sut.numericValue, 6, "\(String(describing: sut)) numeric value is incorrect")
            case .sixOfHearts:
                XCTAssertEqual(sut.numericValue, 6, "\(String(describing: sut)) numeric value is incorrect")
            case .sevenOfSpades:
                XCTAssertEqual(sut.numericValue, 7, "\(String(describing: sut)) numeric value is incorrect")
            case .sevenOfDiamonds:
                XCTAssertEqual(sut.numericValue, 7, "\(String(describing: sut)) numeric value is incorrect")
            case .sevenOfClubs:
                XCTAssertEqual(sut.numericValue, 7, "\(String(describing: sut)) numeric value is incorrect")
            case .sevenOfHearts:
                XCTAssertEqual(sut.numericValue, 7, "\(String(describing: sut)) numeric value is incorrect")
            case .eightOfSpades:
                XCTAssertEqual(sut.numericValue, 8, "\(String(describing: sut)) numeric value is incorrect")
            case .eightOfDiamonds:
                XCTAssertEqual(sut.numericValue, 8, "\(String(describing: sut)) numeric value is incorrect")
            case .eightOfClubs:
                XCTAssertEqual(sut.numericValue, 8, "\(String(describing: sut)) numeric value is incorrect")
            case .eightOfHearts:
                XCTAssertEqual(sut.numericValue, 8, "\(String(describing: sut)) numeric value is incorrect")
            case .nineOfSpades:
                XCTAssertEqual(sut.numericValue, 9, "\(String(describing: sut)) numeric value is incorrect")
            case .nineOfDiamonds:
                XCTAssertEqual(sut.numericValue, 9, "\(String(describing: sut)) numeric value is incorrect")
            case .nineOfClubs:
                XCTAssertEqual(sut.numericValue, 9, "\(String(describing: sut)) numeric value is incorrect")
            case .nineOfHearts:
                XCTAssertEqual(sut.numericValue, 9, "\(String(describing: sut)) numeric value is incorrect")
            case .tenOfSpades:
                XCTAssertEqual(sut.numericValue, 10, "\(String(describing: sut)) numeric value is incorrect")
            case .tenOfDiamonds:
                XCTAssertEqual(sut.numericValue, 10, "\(String(describing: sut)) numeric value is incorrect")
            case .tenOfClubs:
                XCTAssertEqual(sut.numericValue, 10, "\(String(describing: sut)) numeric value is incorrect")
            case .tenOfHearts:
                XCTAssertEqual(sut.numericValue, 10, "\(String(describing: sut)) numeric value is incorrect")
            case .jackOfSpades:
                XCTAssertEqual(sut.numericValue, 11, "\(String(describing: sut)) numeric value is incorrect")
            case .jackOfDiamonds:
                XCTAssertEqual(sut.numericValue, 11, "\(String(describing: sut)) numeric value is incorrect")
            case .jackOfClubs:
                XCTAssertEqual(sut.numericValue, 11, "\(String(describing: sut)) numeric value is incorrect")
            case .jackOfHearts:
                XCTAssertEqual(sut.numericValue, 11, "\(String(describing: sut)) numeric value is incorrect")
            case .queenOfSpades:
                XCTAssertEqual(sut.numericValue, 12, "\(String(describing: sut)) numeric value is incorrect")
            case .queenOfDiamonds:
                XCTAssertEqual(sut.numericValue, 12, "\(String(describing: sut)) numeric value is incorrect")
            case .queenOfClubs:
                XCTAssertEqual(sut.numericValue, 12, "\(String(describing: sut)) numeric value is incorrect")
            case .queenOfHearts:
                XCTAssertEqual(sut.numericValue, 12, "\(String(describing: sut)) numeric value is incorrect")
            case .kingOfSpades:
                XCTAssertEqual(sut.numericValue, 13, "\(String(describing: sut)) numeric value is incorrect")
            case .kingOfDiamonds:
                XCTAssertEqual(sut.numericValue, 13, "\(String(describing: sut)) numeric value is incorrect")
            case .kingOfClubs:
                XCTAssertEqual(sut.numericValue, 13, "\(String(describing: sut)) numeric value is incorrect")
            case .kingOfHearts:
                XCTAssertEqual(sut.numericValue, 13, "\(String(describing: sut)) numeric value is incorrect")
            case .blueBack:
                XCTAssertEqual(sut.numericValue, nil, "\(String(describing: sut)) numeric value is incorrect")
            }
        }
    }
    
    // MARK: - Card for tests
    func testCardFor_whenPassingZeroOfClubs_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 0, suit: .clubs))
    }
    
    func testCardFor_whenPassingZeroOfHearts_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 0, suit: .hearts))
    }
    
    func testCardFor_whenPassingZeroOfSpades_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 0, suit: .spades))
    }
    
    func testCardFor_whenPassingZeroOfDiamonds_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 0, suit: .diamonds))
    }
    
    func testCardFor_whenPassingFourteenOfClubs_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 14, suit: .clubs))
    }
    
    func testCardFor_whenPassingFourteenOfHearts_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 14, suit: .hearts))
    }
    
    func testCardFor_whenPassingFourteenOfSpades_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 14, suit: .spades))
    }
    
    func testCardFor_whenPassingFourteenOfDiamonds_returnsNil() {
        XCTAssertNil(CardType.cardFor(value: 14, suit: .diamonds))
    }
    
    func testCardFor_whenPassingRightValueAndSuit_returnsCardTypeObject() {
        for suit in SuitType.allCases {
            for value in 1...13 {
                // when
                let cardType = CardType.cardFor(value: value, suit: suit)
                
                // then
                XCTAssertNotNil(cardType)
            }
        }
    }
    
    func testCardFor_whenPassingRightValueAndSuit_returnedObjectHasSameNumericValueAsTheOnePassed() {
        for suit in SuitType.allCases {
            for value in 1...13 {
                // when
                let cardType = CardType.cardFor(value: value, suit: suit)
                
                // then
                XCTAssertEqual(cardType?.numericValue, value)
            }
        }
    }
    
    // MARK: - Suit for Card Test
    func testSuitFor_whenSuitForCardIsCalled_correctSuitIsReturned() {
        let allCardTypes = CardType.allCases
               
               for sut in allCardTypes {
                   switch sut {
                   case .aceOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .aceOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .aceOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .aceOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .twoOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .twoOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .twoOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .twoOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .threeOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .threeOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .threeOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .threeOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .fourOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .fourOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .fourOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .fourOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .fiveOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .fiveOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .fiveOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .fiveOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .sixOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .sixOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .sixOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .sixOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .sevenOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .sevenOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .sevenOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .sevenOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .eightOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .eightOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .eightOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .eightOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .nineOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .nineOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .nineOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .nineOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .tenOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .tenOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .tenOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .tenOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .jackOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .jackOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .jackOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .jackOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .queenOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .queenOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .queenOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .queenOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .kingOfSpades:
                        XCTAssertEqual(sut.suit, .spades, "\(String(describing: sut)) suit is incorrect")
                   case .kingOfDiamonds:
                        XCTAssertEqual(sut.suit, .diamonds, "\(String(describing: sut)) suit is incorrect")
                   case .kingOfClubs:
                        XCTAssertEqual(sut.suit, .clubs, "\(String(describing: sut)) suit is incorrect")
                   case .kingOfHearts:
                        XCTAssertEqual(sut.suit, .hearts, "\(String(describing: sut)) suit is incorrect")
                   case .blueBack:
                        XCTAssertEqual(sut.suit, nil, "\(String(describing: sut)) suit is incorrect")
                   }
               }
    }
}
