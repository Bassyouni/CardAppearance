//
//  CreateSecondsUseCaseStub.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 6/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import RxTest
import Foundation
@testable import CardAppearance

final class CreateSecondsUseCaseStub: CreateSecondsTimerUseCaseInterface {
    
    let scheduler: SchedulerType
    init(scheduler: SchedulerType) {
        self.scheduler = scheduler
    }
    
    var secondsObservable: Observable<Int> {
        Observable.of(1,2,3,4,5,6,7,8,9,10,11,12,13,1,2,3, scheduler: scheduler)
    }
}
