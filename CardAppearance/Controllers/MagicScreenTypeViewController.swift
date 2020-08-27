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
    let titleLabel = UILabel()
    let emptyScreenButton = UIButton()
    let screenWithCardButton = UIButton()
    
    // MARK: - Variables
    weak var delegate: MagicScreenTypeViewControllerDelegate?
    
    // MARK: - Initializers
    init(delegate: MagicScreenTypeViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - Initialization
    private func setupViews() {
        view.addSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(titleLabel)
        buttonsStackView.addArrangedSubview(emptyScreenButton)
        buttonsStackView.addArrangedSubview(screenWithCardButton)
        
        configureStackView()
        configureTitleLabel()
        configureEmptyScreenButton()
        configureScreenWithCardButton()
    }
    
    private func configureStackView() {
        buttonsStackView.axis = .vertical
        buttonsStackView.alignment = .center
        buttonsStackView.distribution = .fill
        buttonsStackView.spacing = 20
    }
    
    private func configureTitleLabel() {
        titleLabel.text = "Choose a Screen Type"
        titleLabel.font = .monospacedSystemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = .init(red: 252/255, green: 107/255, blue: 170/255, alpha: 1)
    }
     
    private func configureEmptyScreenButton() {
        applyButtonAppearance(for: emptyScreenButton)
        emptyScreenButton.setTitle("Empty Screen", for: .normal)
        emptyScreenButton.addTarget(self, action: #selector(handleEmptyScreenButtonAction), for: .touchUpInside)
    }
    
    private func configureScreenWithCardButton() {
        applyButtonAppearance(for: screenWithCardButton)
        screenWithCardButton.setTitle("Screen With Card", for: .normal)
        screenWithCardButton.addTarget(self, action: #selector(handleWithCardButtonAction), for: .touchUpInside)
    }
    
    private func applyButtonAppearance(for button: UIButton) {
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .monospacedSystemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .init(red: 31/255, green: 31/255, blue: 36/255, alpha: 1)
        button.setTitleColor(.init(red: 252/255, green: 116/255, blue: 103/255, alpha: 1), for: .normal)
    }
    
    private func setupConstraints() {
        emptyScreenButton.translatesAutoresizingMaskIntoConstraints = false
        buttonsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        emptyScreenButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        emptyScreenButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        screenWithCardButton.equalWidthAndHeight(to: emptyScreenButton, multiplier: 1)
        
        buttonsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20).isActive = true
    }
    
    // MARK: - Actions
    @objc private func handleEmptyScreenButtonAction() {
        delegate?.didChooseEmptyScreen()
    }
    
    @objc private func handleWithCardButtonAction() {
        delegate?.didChooseScreenWithCard()
    }
}
