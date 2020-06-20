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
    
    var sut: MagicViewModel!
    var secondsUseCaseMock: CreateSecondsUseCaseStub!
    var scheduler: TestScheduler!
    var bag: DisposeBag!

    override func setUp()  {
        super.setUp()
        bag = DisposeBag()
        scheduler = TestScheduler(initialClock: 0)
        secondsUseCaseMock = CreateSecondsUseCaseStub(scheduler: scheduler)
        sut = MagicViewModel(secondsUseCase: secondsUseCaseMock)
    }

    override func tearDown() {
        sut = nil
        secondsUseCaseMock = nil
        scheduler = nil
        bag = nil
        super.tearDown()
    }
    
    // MARK: - Quadrent Actions
    func testTopLeadingQuadrantAction_whenCalled_publishedCardIsClubsSuit() {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var cardToBeShown: CardType?
        sut.showCardObservable.subscribe(onNext: { (card) in
            cardToBeShown = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        // when
        scheduler.start()
        sut.didTapTopLeadingQuadrant()
        
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(cardToBeShown?.suit, SuitType.clubs)
    }
    
    func testTopTrailingQuadrantAction_whenCalled_publishedCardIsDiamondsSuit() {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var cardToBeShown: CardType?
        sut.showCardObservable.subscribe(onNext: { (card) in
            cardToBeShown = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        // when
        scheduler.start()
        sut.didTapTopTrailingQuadrant()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(cardToBeShown?.suit, SuitType.diamonds)
    }
    
    func testBottomTrailingQuadrantAction_whenCalled_publishedCardIsSpadesSuit() {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var cardToBeShown: CardType?
        sut.showCardObservable.subscribe(onNext: { (card) in
            cardToBeShown = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        // when
        scheduler.start()
        sut.didTapBottomTrailingQuadrant()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(cardToBeShown?.suit, SuitType.spades)
    }
    
    func testBottomLeadingQuadrantAction_whenCalled_publishedCardIsDiamondsSuit() {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var cardToBeShown: CardType?
        sut.showCardObservable.subscribe(onNext: { (card) in
            cardToBeShown = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        // when
        scheduler.start()
        sut.didTapBottomLeadingQuadrant()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(cardToBeShown?.suit, SuitType.hearts)
    }
    
    
    // MARK: - Time Fetching
    func testFetchingCurrentTimeInHours_returnsCurrentTime() {
        // when
        let currentHours = sut.currentTimeHours
        
        // given
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        // then
        XCTAssertEqual(currentHours, hour)
    }
    
    func testFetchingCurrentTimeInMinutes_returnsCurrentTime() {
        // when
        let currentMinutes = sut.currentTimeMinutes
        
        // given
        let date = Date()
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        
        // then
        XCTAssertEqual(currentMinutes, minutes)
    }
    
    func testSeconds_whenNewElementsArrive_formatSecondsProperly() {
        let observer = scheduler.start(created: 0, subscribed: 0, disposed: 17) {
            self.sut.secondsTimeObservable
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
    func testCardSelectionLogic_whenClubsIsSelectedAtSecondOne_AceOfClubsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .aceOfClubs
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .clubs)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenhHeartsIsSelectedAtSecondOne_AceOfHeartsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .aceOfHearts
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .hearts)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenDiamondsIsSelectedAtSecondOne_AceOfDiamondsIsEmitted() throws {
        // given// given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .aceOfDiamonds
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .diamonds)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenSpadessIsSelectedAtSecondOne_AceOfSpadesIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .aceOfSpades
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .spades)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenClubsIsSelectedAtSecondTwo_twoOfClubsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .twoOfClubs
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .clubs)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenhHeartsIsSelectedAtSecondTwo_twoOfHeartsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .twoOfHearts
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .hearts)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenDiamondsIsSelectedAtSecondTwo_twoOfDiamondsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .twoOfDiamonds
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .diamonds)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenSpadessIsSelectedAtSecondTwo_twoOfSpadesIsEmitted() throws {
       // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .twoOfSpades
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .spades)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenClubsIsSelectedAtSecondThirteen_kingOfClubsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .kingOfClubs
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .clubs)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenhHeartsIsSelectedAtSecondThirteen_kingOfHeartsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .kingOfHearts
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .hearts)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenDiamondsIsSelectedAtSecondThirteen_kingOfDiamondsIsEmitted() throws {
        // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .kingOfDiamonds
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .diamonds)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
    
    func testCardSelectionLogic_whenSpadessIsSelectedAtSecondThirteen_kingOfSpadesIsEmitted() throws {
       // given
        let exp = expectation(description: "Card is not Emitted")
        var emittedCard: CardType?
        let expectedCard: CardType = .kingOfSpades
        
        sut
        .showCardObservable
        .subscribe(onNext: { (card) in
            emittedCard = card
            exp.fulfill()
        })
        .disposed(by: bag)
        
        
        // when
         sut.secondsTimeObservable
            .compactMap { Int($0) }
            .map { $0 - 10 }
            .take(expectedCard.numericValue)
            .subscribe(onNext: { (second) in
                if second == expectedCard.numericValue {
                    self.sut.cardSelected(withType: .spades)
                }
            })
            .disposed(by: bag)
        
        scheduler.start()
        
        // then
        wait(for: [exp], timeout: 1)
        XCTAssertEqual(emittedCard, expectedCard)
    }
}

