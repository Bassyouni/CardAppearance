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
    
    // MARK: - Variables
    private let showCardSubject = PublishSubject<CardType>()
    
   
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
}
