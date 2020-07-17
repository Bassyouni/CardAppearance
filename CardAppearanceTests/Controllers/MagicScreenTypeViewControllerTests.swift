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
        let (sut, spy) = makeSUT()
        
        sut.emptyScreenButton.sendActions(for: .touchUpInside)
        
        XCTAssertTrue(spy.didChooseEmptyScreenDelegateNotified)
    }
    
    func test_screenWithCardButtonPressed_firesDelegateMethod() {
        let (sut, spy) = makeSUT()

        sut.screenWithCardButton.sendActions(for: .touchUpInside)

        XCTAssertTrue(spy.didChooseScreenWithCardDelegateNotified)
    }
    
    func test_emptyScreenButton_hasCorrectTitle() {
        XCTAssertEqual(makeSUT().sut.emptyScreenButton.titleLabel?.text, "Empty Screen")
    }
    
    func test_screenWithCardButton_hasCorrectTitle() {
        XCTAssertEqual(makeSUT().sut.screenWithCardButton.titleLabel?.text, "Screen With Card")
    }
    
    func test_titleHasCorrectText() {
        XCTAssertEqual(makeSUT().sut.titleLabel.text, "Choose a Screen Type")
    }
    
    // MARK: - Helpers
    func makeSUT() -> (sut: MagicScreenTypeViewController, spy: MagicScreenSpy) {
        let sut = MagicScreenTypeViewController()
        let spy = MagicScreenSpy()
        sut.delegate = spy
        _ = sut.view
        return (sut, spy)
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
