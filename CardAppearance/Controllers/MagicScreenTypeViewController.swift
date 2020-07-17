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
    
    // MARK: - UI Variables
    let buttonsStackView = UIStackView()
    let emptyScreenButton = UIButton()
    let screenWithCardButton = UIButton()
    
    // MARK: - Variables
    weak var delegate: MagicScreenTypeViewControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Initialization
    private func setupViews() {
        view.addSubview(buttonsStackView)
        buttonsStackView.addSubviews(emptyScreenButton, screenWithCardButton)
        
        configureEmptyScreenButton()
        configureScreenWithCardButton()
    }
     
    private func configureEmptyScreenButton() {
        emptyScreenButton.addTarget(self, action: #selector(handleEmptyScreenButtonAction), for: .touchUpInside)
    }
    
    private func configureScreenWithCardButton() {
        screenWithCardButton.addTarget(self, action: #selector(handleWithCardButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    
    
    
    @objc private func handleEmptyScreenButtonAction() {
        delegate?.didChooseEmptyScreen()
    }
    
    @objc private func handleWithCardButtonAction() {
        delegate?.didChooseScreenWithCard()
    }
}
