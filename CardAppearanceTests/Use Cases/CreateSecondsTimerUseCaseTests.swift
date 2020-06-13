//
//  CreateSecondsTimerUseCaseTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 6/13/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import RxBlocking
import RxTest
import XCTest
import RxCocoa
@testable import CardAppearance

class CreateSecondsTimerUseCaseTests: XCTestCase {
    
    var sut: CreateSecondsTimerUseCase!
    var bag: DisposeBag!
    
    override func setUp() {
        bag = DisposeBag()
        sut = getSutWithScheduler(scheduler: MainScheduler.instance)
    }
    
    override func tearDown() {
        sut = nil
        bag = nil
    }
    
    private func getSutWithScheduler(scheduler: SchedulerType) -> CreateSecondsTimerUseCase {
        return CreateSecondsTimerUseCase(scheduler: scheduler)
    }
    
    func testSecondsObservable_initialState_equalsOne() throws {
        XCTAssertEqual(try sut.secondsObservable.take(1).toBlocking().first(), 1)
    }
    
    func testSecondsObservable_whenReachesTwelve_resetsBackToOne() {
        let scheduler = TestScheduler(initialClock: 0)
        
        let res = scheduler.start(created: 0, subscribed: 0, disposed: 14) {
            self.getSutWithScheduler(scheduler: scheduler).secondsObservable
        }
        
        let correctSequence = [
            Recorded.next(1, 1),
            Recorded.next(2, 2),
            Recorded.next(3, 3),
            Recorded.next(4, 4),
            Recorded.next(5, 5),
            Recorded.next(6, 6),
            Recorded.next(7, 7),
            Recorded.next(8, 8),
            Recorded.next(9, 9),
            Recorded.next(10, 10),
            Recorded.next(11, 11),
            Recorded.next(12, 12),
            Recorded.next(13, 1),
        ]
        
        XCTAssertEqual(res.events, correctSequence)
    }

}
