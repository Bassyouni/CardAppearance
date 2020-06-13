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
    
    var secondsObservable: Observable<Int> {
        return timerSubject.asObservable()
    }
    
    // MARK: - Initializers
    init() {
        startTimer()
    }
    
    private func startTimer() {
        timerDisposable = Observable<Int>
            .timer(.seconds(0), period: .seconds(1), scheduler: MainScheduler.instance)
            .map { $0 + 1 }
            .subscribe(onNext: { [weak self] (second) in
                self?.timerSubject.onNext(second)
            })
    }
}
