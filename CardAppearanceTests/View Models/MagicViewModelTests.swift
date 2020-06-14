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
    var secondsUseCaseMock: CreateSecondsUseCaseMock!
    var scheduler: TestScheduler!

    override func setUp()  {
        super.setUp()
        scheduler = TestScheduler(initialClock: 0)
        secondsUseCaseMock = CreateSecondsUseCaseMock(scheduler: scheduler)
        sut = MagicViewModel(secondsUseCase: secondsUseCaseMock)
    }

    override func tearDown() {
        sut = nil
        secondsUseCaseMock = nil
        scheduler = nil
        super.tearDown()
    }

    // MARK: - Quadrent Actions
    func testWhenTopLeadingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapTopLeadingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isTopLeadingQuadrantTapped)
    }
    
    func testWhenTopTrailingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapTopTrailingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isTopTrailingQuadrantTapped)
    }
    
    func testWhenBottomLeadingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapBottomLeadingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isBottomLeadingQuadrantTapped)
    }
    
    func testWhenBottomTrailingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapBottomTrailingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isBottomTrailingQuadrantTapped)
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
}

