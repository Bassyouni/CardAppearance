//
//  MagicScreenTypeViewControllerTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 7/17/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class MagicScreenTypeViewControllerTests: XCTestCase {
    
    func test_emptyScreenButtonPressed_firesDelegateMethod() {
        let sut = MagicScreenTypeViewController()
        let spy = MagicScreenSpy()
        sut.delegate = spy
        
        sut.handleEmptyScreenButtonAction()
        
        XCTAssertTrue(spy.didChooseEmptyScreenDelegateNotified)
    }
    
    func test_withCardButtonPressed_firesDelegateMethod() {
        let sut = MagicScreenTypeViewController()
        let spy = MagicScreenSpy()
        sut.delegate = spy
        
        sut.handleWithCardButtonAction()
        
        XCTAssertTrue(spy.didChooseScreenWithCardDelegateNotified)
    }
    
    // MARK: - Spy
    class MagicScreenSpy: MagicScreenTypeViewControllerDelegate {
        var didChooseEmptyScreenDelegateNotified = false
        var didChooseScreenWithCardDelegateNotified = false
        
        func didChooseEmptyScreen() {
             didChooseEmptyScreenDelegateNotified = true
        }
        
        func didChooseScreenWithCard() {
           didChooseScreenWithCardDelegateNotified = true
        }
    }
}
