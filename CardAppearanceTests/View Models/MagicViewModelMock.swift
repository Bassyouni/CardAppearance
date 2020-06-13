//
//  MagicViewModelMock.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import Foundation
@testable import CardAppearance

final class MagicViewModelMock: MagicViewModelInterface {
   
    var currentTimeHours: Int {
        return 0
    }
    
    var currentTimeMinutes: Int {
        return 0
    }

    var isTopLeadingQuadrantTapped: Bool = false
    var isTopTrailingQuadrantTapped: Bool = false
    var isBottomLeadingQuadrantTapped: Bool = false
    var isBottomTrailingQuadrantTapped: Bool = false
    
    let showCardSubject = PublishSubject<CardType>()
    
    var showCardObservable: Observable<CardType> {
        return showCardSubject.asObservable()
    }

    func didTapTopLeadingQuadrant() {
        isTopLeadingQuadrantTapped = true
    }

    func didTapTopTrailingQuadrant() {
        isTopTrailingQuadrantTapped = true
    }

    func didTapBottomLeadingQuadrant() {
        isBottomLeadingQuadrantTapped = true
    }

    func didTapBottomTrailingQuadrant() {
        isBottomTrailingQuadrantTapped = true
    }
}
