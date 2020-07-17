//
//  MagicScreenTypeViewController.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 7/17/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import UIKit

protocol MagicScreenTypeViewControllerDelegate: class {
    func didChooseEmptyScreen()
    func didChooseScreenWithCard()
}

final class MagicScreenTypeViewController: UIViewController {
    
    weak var delegate: MagicScreenTypeViewControllerDelegate?
    
    func handleEmptyScreenButtonAction() {
        delegate?.didChooseEmptyScreen()
    }
    
    func handleWithCardButtonAction() {
        delegate?.didChooseScreenWithCard()
    }
}
