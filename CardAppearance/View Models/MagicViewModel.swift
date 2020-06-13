//
//  MagicViewModel.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import Foundation

final class MagicViewModel: MagicViewModelInterface {
   
    func didTapTopLeadingQuadrant() {
        
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
