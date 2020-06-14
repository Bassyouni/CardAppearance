//
//  MagicViewModel.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import Foundation

final class MagicViewModel: MagicViewModelInterface {
    
    // MARK: - Initializers
    init(secondsUseCase: CreateSecondsTimerUseCaseInterface) {
        self.secondsUseCase = secondsUseCase
        setupBindings()
    }
    
    // MARK: - Variables
    private let showCardSubject = PublishSubject<CardType>()
    private let secondsUseCase: CreateSecondsTimerUseCaseInterface
    private var currentSecond = 0
    private let bag = DisposeBag()
    
    // MARK: - Initialization
    private func setupBindings() {
        secondsUseCase.secondsObservable.subscribe(onNext: { [weak self] (currentSecond) in
            self?.currentSecond = currentSecond
        }).disposed(by: bag)
    }
   
   // MARK: - Actions
    func didTapTopLeadingQuadrant() {
        showCardSubject.onNext(.aceOfClubs)
    }

    func didTapTopTrailingQuadrant() {
        
    }
    
    func didTapBottomLeadingQuadrant() {
        
    }
    
    func didTapBottomTrailingQuadrant() {
        
    }
    
    func cardSelected(withType type: SuitType) {
        if let selectedCard = CardType.cardFor(value: currentSecond, suit: type) {
            showCardSubject.onNext(selectedCard)
        }
    }
}

// MARK: - Public
extension MagicViewModel {
    var currentTimeHours: Int {
        Calendar.current.component(.hour, from: Date())
    }
    
    var currentTimeMinutes: Int {
        Calendar.current.component(.minute, from: Date())
    }
    
    var showCardObservable: Observable<CardType> {
        showCardSubject.asObservable()
    }
    
    var secondsTimeObservable: Observable<String> {
        secondsUseCase.secondsObservable
            .map { $0 + 10 }
            .map { "\($0)" }
    }
}
