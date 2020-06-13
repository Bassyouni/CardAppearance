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
            }
        }
    }
    
    func testCardType_whenCardImageInstantiated_imageIsNotNil() {
        let allCardTypes = CardType.allCases
        for sut in allCardTypes {
            XCTAssertNotNil(UIImage(named: sut.imageName), "\(String(describing: sut)) image is nil")
        }
    }
}
