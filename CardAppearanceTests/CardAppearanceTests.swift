//
//  CardAppearanceTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class CardAppearanceTests: XCTestCase {
    
    var sut: MagicViewController!
    var mockViewModel: MagicViewModelMock!

    override func setUpWithError() throws {
        try super.setUpWithError()
        mockViewModel = MagicViewModelMock()
        sut = MagicViewController(viewModel: mockViewModel)
    }

    override func tearDownWithError() throws {
        sut = nil
        mockViewModel = nil
        try super.tearDownWithError()
    }

    // MARK: - Quadrent Actions
    func testWhenTopLeadingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapTopLeadingQuadrant()
        
        // then
        XCTAssertTrue(mockViewModel.isTopLeadingQuadrantTapped)
    }
    
    func testWhenTopTrailingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapTopTrailingQuadrant()
        
        // then
        XCTAssertTrue(mockViewModel.isTopTrailingQuadrantTapped)
    }
    
    func testWhenBottomLeadingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapBottomLeadingQuadrant()
        
        // then
        XCTAssertTrue(mockViewModel.isBottomLeadingQuadrantTapped)
    }
    
    func testWhenBottomTrailingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapBottomTrailingQuadrant()
        
        // then
        XCTAssertTrue(mockViewModel.isBottomTrailingQuadrantTapped)
    }
    
    // MARK: - Appearance
    func testStatusBarIsHidden() {
        XCTAssertTrue(sut.prefersStatusBarHidden)
    }
    
}
