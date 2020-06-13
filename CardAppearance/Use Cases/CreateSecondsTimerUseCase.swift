//
//  CreateSecondsTimerUseCase.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 6/13/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import Foundation

protocol CreateSecondsTimerUseCaseInterface {
    var secondsObservable: Observable<Int> { get }
}

final class CreateSecondsTimerUseCase: CreateSecondsTimerUseCaseInterface {
    
    // MARK: - Variables
    private let timerSubject = PublishSubject<Int>()
    private let bag = DisposeBag()
    private var timerDisposable: Disposable?
    private let scheduler: SchedulerType
    
    private var _oneSecondTimer: Observable<Int> {
        return Observable<Int>.interval(.seconds(1), scheduler: scheduler)
    }
    
    var secondsObservable: Observable<Int> {
        _oneSecondTimer
            .map { $0 % 12 }
            .map { $0 + 1 }
    }
    
    // MARK: - Initializers
    init(scheduler: SchedulerType) {
        self.scheduler = scheduler
    }
}
