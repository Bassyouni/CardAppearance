//
//  MagicViewModelTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 5/31/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import RxTest
import XCTest
@testable import CardAppearance

class MagicViewModelTests: XCTestCase {

    let bag = DisposeBag()
    
    // MARK: - Quadrent Actions
    func testTopLeadingQuadrantAction_whenCalled_publishedCardIsClubsSuit() {
        let suit = getPublishedCardSuit(whenDoing: { sut in
            sut.didTapTopLeadingQuadrant()
        })
        
        XCTAssertEqual(suit, SuitType.clubs)
    }
    
    func testTopTrailingQuadrantAction_whenCalled_publishedCardIsDiamondsSuit() {
        let suit = getPublishedCardSuit(whenDoing: { sut in
            sut.didTapTopTrailingQuadrant()
        })
        
        XCTAssertEqual(suit, SuitType.diamonds)
    }
    
    func testBottomTrailingQuadrantAction_whenCalled_publishedCardIsSpadesSuit() {
        let suit = getPublishedCardSuit(whenDoing: { sut in
            sut.didTapBottomTrailingQuadrant()
        })
        
        XCTAssertEqual(suit, SuitType.spades)
    }
    
    func testBottomLeadingQuadrantAction_whenCalled_publishedCardIsDiamondsSuit() {
        let suit = getPublishedCardSuit(whenDoing: { sut in
            sut.didTapBottomLeadingQuadrant()
        })
    
        XCTAssertEqual(suit, SuitType.hearts)
    }
    
    // MARK: - Time Fetching
    func testFetchingCurrentTimeInHours_returnsCurrentTime() {
        let (sut, _) = makeSUT()
        let currentHours = sut.currentTimeHours
        
        let hour = currentDateGetValueFor(.hour)
        
        XCTAssertEqual(currentHours, hour)
    }
    
    func testFetchingCurrentTimeInMinutes_returnsCurrentTime() {
        let (sut, _) = makeSUT()
        let currentMinutes = sut.currentTimeMinutes
        
        let minutes = currentDateGetValueFor(.minute)
        
        XCTAssertEqual(currentMinutes, minutes)
    }
    
    func testSeconds_whenNewElementsArrive_formatSecondsProperly() {
        let (sut, scheduler) = makeSUT()
        let observer = scheduler.start(created: 0, subscribed: 0, disposed: 17) {
            sut.secondsTimeObservable
        }
        
        let correctSequence = [
            Recorded.next(1, "11"),
            Recorded.next(2, "12"),
            Recorded.next(3, "13"),
            Recorded.next(4, "14"),
            Recorded.next(5, "15"),
            Recorded.next(6, "16"),
            Recorded.next(7, "17"),
            Recorded.next(8, "18"),
            Recorded.next(9, "19"),
            Recorded.next(10, "20"),
            Recorded.next(11, "21"),
            Recorded.next(12, "22"),
            Recorded.next(13, "23"),
            Recorded.next(14, "11"),
            Recorded.next(15, "12"),
            Recorded.next(16, "13"),
        ]
        
        XCTAssertEqual(observer.events, correctSequence)
    }
    
    // MARK: - Card selection Logic
    func testCardSelectionLogic_whenClubsIsSelectedAtSecondOne_AceOfClubsIsEmitted() {
        let expectedCard: CardType = .aceOfClubs
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenhHeartsIsSelectedAtSecondOne_AceOfHeartsIsEmitted() {
        let expectedCard: CardType = .aceOfHearts
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenDiamondsIsSelectedAtSecondOne_AceOfDiamondsIsEmitted() {
        let expectedCard: CardType = .aceOfDiamonds
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenSpadessIsSelectedAtSecondOne_AceOfSpadesIsEmitted() {
        let expectedCard: CardType = .aceOfSpades
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenClubsIsSelectedAtSecondTwo_twoOfClubsIsEmitted() {
        let expectedCard: CardType = .twoOfClubs
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenhHeartsIsSelectedAtSecondTwo_twoOfHeartsIsEmitted() {
        let expectedCard: CardType = .twoOfHearts
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenDiamondsIsSelectedAtSecondTwo_twoOfDiamondsIsEmitted() {
        let expectedCard: CardType = .twoOfDiamonds
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenSpadessIsSelectedAtSecondTwo_twoOfSpadesIsEmitted() {
        let expectedCard: CardType = .twoOfSpades
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenClubsIsSelectedAtSecondThirteen_kingOfClubsIsEmitted() {
        let expectedCard: CardType = .kingOfClubs
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenhHeartsIsSelectedAtSecondThirteen_kingOfHeartsIsEmitted() {
        let expectedCard: CardType = .kingOfHearts
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenDiamondsIsSelectedAtSecondThirteen_kingOfDiamondsIsEmitted() {
        let expectedCard: CardType = .kingOfSpades
        
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenSpadessIsSelectedAtSecondThirteen_kingOfSpadesIsEmitted() {
        let expectedCard: CardType = .kingOfSpades
    
        let emittedCard = getEmittedCardBasedOn(expectedCard)

        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    // MARK: - Helpers
    private func makeSUT() -> (MagicViewModel, TestScheduler) {
        let scheduler = TestScheduler(initialClock: 0)
        let secondsUseCaseMock = CreateSecondsUseCaseStub(scheduler: scheduler)
        return (MagicViewModel(secondsUseCase: secondsUseCaseMock), scheduler)
    }
    
    private func getPublishedCardSuit(whenDoing action: (MagicViewModel) -> Void) -> SuitType? {
        let (sut, scheduler) = makeSUT()
        let exp = expectation(description: "Card is not Emitted")
        var cardToBeShown: CardType?
        
        sut.showCardObservable.subscribe(onNext: { (card) in
            cardToBeShown = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        scheduler.start()
        action(sut)
        
        wait(for: [exp], timeout: 1)
        return cardToBeShown?.suit
    }
    
    private func currentDateGetValueFor(_ component: Calendar.Component) -> Int {
        let date = Date()
        let calendar = Calendar.current
        return calendar.component(component, from: date)
    }
    
    private func getEmittedCardBasedOn(_ expectedCard: CardType) -> CardType? {
        let (sut, scheduler) = makeSUT()
        var emittedCard: CardType?
        let exp = expectation(description: "Card is not Emitted")
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    sut.cardSelected(withType: expectedCard.suit)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        wait(for: [exp], timeout: 1)
        return emittedCard
    }
}
