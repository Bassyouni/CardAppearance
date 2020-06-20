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
    
    let showCardSubject = PublishSubject<CardType>()
    var currentTimeHours: Int { return 0 }
    var currentTimeMinutes: Int { return 0 }
    var secondsTimeObservable: Observable<String> { Observable.of("1", "2", "3") }
    var showCardObservable: Observable<CardType> { showCardSubject.asObservable() }

    var isTopLeadingQuadrantTapped: Bool = false
    var isTopTrailingQuadrantTapped: Bool = false
    var isBottomLeadingQuadrantTapped: Bool = false
    var isBottomTrailingQuadrantTapped: Bool = false
    
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
