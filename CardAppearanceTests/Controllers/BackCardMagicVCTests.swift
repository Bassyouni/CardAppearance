//
//  BackCardMagicVCTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 06/12/2020.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class BackCardMagicVC: MagicViewController {
    
    var selectedCard: CardType?
    
    override func showCard(ofType card: CardType) {
        if let selectedCard = selectedCard {
            super.showCard(ofType: selectedCard)
            self.selectedCard = nil
        } else {
            super.showCard(ofType: .blueBack)
            selectedCard = card
        }
    }
    
    override func didSwipeCardImageView() {
        guard let selectedCard = selectedCard else {
            super.didSwipeCardImageView()
            return
        }
        
        showCard(ofType: selectedCard)
    }
}

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

    // MARK: - Helpers
    private func makeSUT() -> (sut: BackCardMagicVC, mockViewModel: MagicViewModelMock) {
        let mockViewModel = MagicViewModelMock()
        let sut = BackCardMagicVC(viewModel: mockViewModel)
        _ = sut.view
        return (sut, mockViewModel)
    }

}
