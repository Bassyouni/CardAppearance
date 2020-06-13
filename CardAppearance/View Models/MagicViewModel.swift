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
    
    var showCardObservable: Observable<CardType> {
        return showCardSubject.asObservable()
    }
    
   
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
        return Calendar.current.component(.hour, from: Date())
    }
    
    var currentTimeMinutes: Int {
        return Calendar.current.component(.minute, from: Date())
    }
}
