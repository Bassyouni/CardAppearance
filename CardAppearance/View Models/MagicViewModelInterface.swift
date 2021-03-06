//
//  MagicViewModelInterface.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import RxSwift
import Foundation

protocol MagicViewModelInterface {
    func didTapTopLeadingQuadrant()
    func didTapTopTrailingQuadrant()
    func didTapBottomLeadingQuadrant()
    func didTapBottomTrailingQuadrant()
    
    var currentTimeHours: Int { get }
    var currentTimeMinutes: Int { get }
    var secondsTimeObservable: Observable<String> { get }
    var showCardObservable: Observable<CardType> { get }
}
