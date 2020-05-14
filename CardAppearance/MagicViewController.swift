//
//  ViewController.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import UIKit

final class MagicViewController: UIViewController {
    
    // MARK: - UI Variables
    private let topLeadingButton = UIButton()
    private let topTrailingButton = UIButton()
    private let bottomLeadingButton = UIButton()
    private let bottomTrailingButton = UIButton()
    
    private let fakeStatusBarContainerView = UIView()
    private let timeLabel = UILabel()
    private let batteryImageView = UIImageView(image: #imageLiteral(resourceName: "batteryIcon"))
    
    // MARK: - Variables
    private let viewModel: MagicViewModelInterface
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    // MARK: - Initializers
    init(viewModel: MagicViewModelInterface) {
        self.viewModel = viewModel
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
        view.addSubview(topLeadingButton)
        view.addSubview(topTrailingButton)
        view.addSubview(bottomLeadingButton)
        view.addSubview(bottomTrailingButton)
        view.addSubview(fakeStatusBarContainerView)
        fakeStatusBarContainerView.addSubview(timeLabel)
        fakeStatusBarContainerView.addSubview(batteryImageView)
        topLeadingButton.backgroundColor = .red
        topTrailingButton.backgroundColor = .blue
        bottomLeadingButton.backgroundColor = .yellow
        bottomTrailingButton.backgroundColor = .green
        view.backgroundColor = .black
        batteryImageView.backgroundColor = .white
        timeLabel.textColor = .white
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        view.translatesAutoresizingMaskIntoConstraints = false
        topLeadingButton.translatesAutoresizingMaskIntoConstraints = false
        topTrailingButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeadingButton.translatesAutoresizingMaskIntoConstraints = false
        bottomTrailingButton.translatesAutoresizingMaskIntoConstraints = false
        constraints.append(contentsOf: addWidthAndHeightConstraints(for: topLeadingButton))
        constraints.append(contentsOf: addWidthAndHeightConstraints(for: topTrailingButton))
        constraints.append(contentsOf: addWidthAndHeightConstraints(for: bottomLeadingButton))
        constraints.append(contentsOf: addWidthAndHeightConstraints(for: bottomTrailingButton))
        
        constraints.append(topLeadingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(topLeadingButton.topAnchor.constraint(equalTo: view.topAnchor))
        
        constraints.append(topTrailingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(topTrailingButton.topAnchor.constraint(equalTo: view.topAnchor))
        
        constraints.append(bottomLeadingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(bottomLeadingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        constraints.append(bottomTrailingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(bottomTrailingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
        constraints.forEach { $0.isActive = true }
    }
    
    // MARK: - Actions
    @objc func didTapTopLeadingQuadrant() {
        viewModel.didTapTopLeadingQuadrant()
    }
    
    @objc func didTapTopTrailingQuadrant() {
        viewModel.didTapTopTrailingQuadrant()
    }
    
    @objc func didTapBottomLeadingQuadrant() {
        viewModel.didTapBottomLeadingQuadrant()
    }
    
    @objc func didTapBottomTrailingQuadrant() {
        viewModel.didTapBottomTrailingQuadrant()
    }
}
 
// MARK: - Helpers
extension MagicViewController {
    private func addWidthAndHeightConstraints(for someView: UIView) -> [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        constraints.append(NSLayoutConstraint(item: someView,
                                              attribute: .width,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .width,
                                              multiplier: 0.5,
                                              constant: 0))
        
        constraints.append(NSLayoutConstraint(item: someView,
                                              attribute: .height,
                                              relatedBy: .equal,
                                              toItem: view,
                                              attribute: .height,
                                              multiplier: 0.5,
                                              constant: 0))
        
        return constraints
    }
}

