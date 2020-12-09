//
//  BackCardMagicVC.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 06/12/2020.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import UIKit

class BackCardMagicVC: MagicViewController {
    
    var selectedCard: CardType?
    
    override func showCard(ofType card: CardType) {
        if let selectedCard = selectedCard {
            super.showCard(ofType: selectedCard)
            self.selectedCard = nil
        } else {
            super.showCard(ofType: .blueBack)
            selectedCard = card
        }
    }
    
    override func didEndPanningCardOfScreen() {
        guard let selectedCard = selectedCard else {
            super.didEndPanningCardOfScreen()
            return
        }
        
        showCard(ofType: selectedCard)
    }
}
