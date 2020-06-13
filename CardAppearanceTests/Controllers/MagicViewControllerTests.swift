//
//  MagicViewControllerTests.swift
//  MagicViewControllerTests
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class MagicViewControllerTests: XCTestCase {
    
    var sut: MagicViewController!
    var mockViewModel: MagicViewModelMock!

    override func setUp() {
        super.setUp()
        mockViewModel = MagicViewModelMock()
        sut = MagicViewController(viewModel: mockViewModel)
        
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        mockViewModel = nil
        super.tearDown()
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
    
    
    // MARK: - Card Appearance Behaviour's
    func testUI_whenShowingSelectedCard_cardImageIsOnTopVisible() {
        // given
        let cardSelected = CardType.aceOfClubs
        let cardImage = UIImage(named: cardSelected.imageName)
        
        // When
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        // Then
        let cardImageView = sut.view.subviews.last as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertEqual(cardImageView?.image?.pngData(), cardImage?.pngData())
    }
}
