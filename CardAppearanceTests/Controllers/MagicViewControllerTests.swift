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
    
    // MARK: - Quadrent Actions
    func testWhenTopLeadingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapTopLeadingQuadrant()
        
        XCTAssertTrue(mockViewModel.isTopLeadingQuadrantTapped)
    }
    
    func testWhenTopTrailingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapTopTrailingQuadrant()
        
        XCTAssertTrue(mockViewModel.isTopTrailingQuadrantTapped)
    }
    
    func testWhenBottomLeadingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapBottomLeadingQuadrant()
        
        XCTAssertTrue(mockViewModel.isBottomLeadingQuadrantTapped)
    }
    
    func testWhenBottomTrailingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapBottomTrailingQuadrant()
        
        XCTAssertTrue(mockViewModel.isBottomTrailingQuadrantTapped)
    }
    
    // MARK: - Appearance
    func testStatusBarIsHidden() {
        XCTAssertTrue(makeSUT().sut.prefersStatusBarHidden)
    }
    
    func testFakeStatusBarIsVisible() {
        XCTAssertFalse(makeSUT().sut.fakeStatusBarContainerView.isHidden)
    }
    
    // MARK: - Card Appearance Behaviours
    func testCardImageView_whenShowingSelectedCard_cardImageIsOnTopVisible() {
        let (sut, mockViewModel) = makeSUT()
        let cardSelected = CardType.aceOfClubs
        let cardImage = UIImage(named: cardSelected.imageName)
        
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        let cardImageView = sut.view.subviews.last as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertEqual(cardImageView?.image?.pngData(), cardImage?.pngData())
    }
    
    func testCardImageView_whenImageTapped_cardImageIsHidden() {
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        sut.didSwipeCardImageView()
        
        let cardImageView = sut.view.subviews.first as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertNil(cardImageView?.image)
    }
    
    func testFakeStatusBar_whenShowingSelectedCard_fakeStatusBarIsHidden() {        
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        XCTAssertTrue(sut.fakeStatusBarContainerView.isHidden)
    }
    
    func testFakeStatusBar_whenCardImageTapped_fakeStatusBarIsVisible() {
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        sut.didSwipeCardImageView()
        
        XCTAssertFalse(sut.fakeStatusBarContainerView.isHidden)
    }
    
    // MARK: - Helpers
    private func makeSUT() -> (sut: MagicViewController, mockViewModel: MagicViewModelMock) {
        let mockViewModel = MagicViewModelMock()
        let sut = MagicViewController(viewModel: mockViewModel)
        sut.loadViewIfNeeded()
        return (sut, mockViewModel)
    }
}
