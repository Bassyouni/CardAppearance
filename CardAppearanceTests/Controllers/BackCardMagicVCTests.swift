//
//  BackCardMagicVCTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 06/12/2020.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class BackCardMagicVCTests: XCTestCase {

    func testCardImageView_whenSelectedCardShouldBeShown_backCardIsShownInstead() {
        let (sut, mockViewModel) = makeSUT()
        let backCard = UIImage(named: CardType.blueBack.imageName)

        mockViewModel.showCardSubject.onNext(.aceOfClubs)

        let cardImageView = sut.view.subviews.last as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertEqual(cardImageView?.image?.pngData(), backCard?.pngData())
    }
    
    func testCardImageView_whenBackCardShownThenSwipped_realCardShows() {
        let (sut, mockViewModel) = makeSUT()
        let selectedCardImage = UIImage(named: CardType.aceOfClubs.imageName)
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        sut.didSwipeCardImageView()
        
        let cardImageView = sut.view.subviews.last as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertEqual(cardImageView?.image?.pngData(), selectedCardImage?.pngData())
    }
    
    func testCardImageView_whenCardIsShownThenResetsAndStartsAgain_newCardIsShown() {
        let (sut, mockViewModel) = makeSUT()
        let selectetSecondType = CardType.kingOfClubs
        let selectedCardImage = UIImage(named: selectetSecondType.imageName)
        
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        sut.didSwipeCardImageView()
        
        mockViewModel.showCardSubject.onNext(selectetSecondType)
        sut.didSwipeCardImageView()
        
        let cardImageView = sut.view.subviews.last as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertEqual(cardImageView?.image?.pngData(), selectedCardImage?.pngData())
    }
    
    func testFakeStatusBar_whenCardImageTapped_fakeStatusBarIsVisible() {
        let (sut, mockViewModel) = makeSUT()
        
        XCTAssertFalse(sut.fakeStatusBarContainerView.isHidden)
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        // this to show the actual card
        sut.didSwipeCardImageView()
        XCTAssertTrue(sut.fakeStatusBarContainerView.isHidden)
        
        // this to actully hide it
        sut.didSwipeCardImageView()
        XCTAssertFalse(sut.fakeStatusBarContainerView.isHidden)
    }

    // MARK: - Helpers
    private func makeSUT() -> (sut: BackCardMagicVC, mockViewModel: MagicViewModelMock) {
        let mockViewModel = MagicViewModelMock()
        let sut = BackCardMagicVC(viewModel: mockViewModel)
        _ = sut.view
        return (sut, mockViewModel)
    }
}
