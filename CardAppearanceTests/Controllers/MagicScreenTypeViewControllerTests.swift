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
        
        sut.handleEmptyScreenAction()
        
        XCTAssertTrue(spy.emptyScreenDelegateNotified)
    }
    
    // MARK: - Spy
    class MagicScreenSpy: MagicScreenTypeViewControllerDelegate {
        var emptyScreenDelegateNotified = false
        
        func didTapEmptyScreen() {
            emptyScreenDelegateNotified = true
        }
    }
}
