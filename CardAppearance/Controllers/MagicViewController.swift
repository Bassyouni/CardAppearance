//
//  ViewController.swift
//  CardAppearance
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

final class MagicViewController: UIViewController {
    
    // MARK: - UI Variables
    private let topLeadingButton = UIButton()
    private let topTrailingButton = UIButton()
    private let bottomLeadingButton = UIButton()
    private let bottomTrailingButton = UIButton()
    
    let fakeStatusBarContainerView = UIView()
    private let timeLabel = UILabel()
    private let batteryView = BatteryView()
    private let cardImageView = UIImageView()
    
    // MARK: - Variables
    private let viewModel: MagicViewModelInterface
    private let bag = DisposeBag()
    
    override var prefersStatusBarHidden: Bool {
        return true
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
        setupBindings()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        batteryView.setNeedsDisplay()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.isIdleTimerDisabled = false
    }
    
    // MARK: - Initialization
    private func setupViews() {
        view.backgroundColor = .black
        view.addSubviews(cardImageView, topLeadingButton, topTrailingButton, bottomLeadingButton, bottomTrailingButton)
        view.addSubviews(fakeStatusBarContainerView, batteryView)
        fakeStatusBarContainerView.addSubviews(timeLabel, batteryView)
        setupTimeLabel()
        setupBatteryView()
        setupCardImageView()
        addTapActionsForQuadrants()
    }
    
    private func setupBatteryView() {
        batteryView.center = view.center
        batteryView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        batteryView.center = view.center
    }
    
    private func setupTimeLabel() {
        timeLabel.textColor = .white
        timeLabel.font = .systemFont(ofSize: 15)
        timeLabel.text = "\(viewModel.currentTimeHours):\(viewModel.currentTimeMinutes):10"
    }
    
    private func setupCardImageView() {
        cardImageView.contentMode = .scaleAspectFit
        cardImageView.isUserInteractionEnabled = true
        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeCardImageView))
        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeCardImageView))
        leftSwipeGesture.direction = .left
        rightSwipeGesture.direction = .right
        cardImageView.addGestureRecognizer(leftSwipeGesture)
        cardImageView.addGestureRecognizer(rightSwipeGesture)
    }
    
    private func addTapActionsForQuadrants() {
        topLeadingButton.addTarget(self, action: #selector(didTapTopLeadingQuadrant), for: .touchUpInside)
        topTrailingButton.addTarget(self, action: #selector(didTapTopTrailingQuadrant), for: .touchUpInside)
        bottomLeadingButton.addTarget(self, action: #selector(didTapBottomLeadingQuadrant), for: .touchUpInside)
        bottomTrailingButton.addTarget(self, action: #selector(didTapBottomTrailingQuadrant), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        view.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        topLeadingButton.translatesAutoresizingMaskIntoConstraints = false
        topTrailingButton.translatesAutoresizingMaskIntoConstraints = false
        bottomLeadingButton.translatesAutoresizingMaskIntoConstraints = false
        bottomTrailingButton.translatesAutoresizingMaskIntoConstraints = false
        fakeStatusBarContainerView.translatesAutoresizingMaskIntoConstraints = false
        batteryView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        constraints.append(cardImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(cardImageView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(cardImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(cardImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        
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
        
        constraints.append(fakeStatusBarContainerView.topAnchor.constraint(equalTo: view.topAnchor))
        constraints.append(fakeStatusBarContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor))
        constraints.append(fakeStatusBarContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor))
        constraints.append(fakeStatusBarContainerView.heightAnchor.constraint(equalToConstant: UIApplication.shared.statusBarFrame.height ))
        
        constraints.append(timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20))
        constraints.append(timeLabel.centerYAnchor.constraint(equalTo: fakeStatusBarContainerView.centerYAnchor))
        
        constraints.append(batteryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15))
        constraints.append(batteryView.widthAnchor.constraint(equalToConstant: 25))
        constraints.append(batteryView.heightAnchor.constraint(equalToConstant: 20))
        constraints.append(batteryView.centerYAnchor.constraint(equalTo: fakeStatusBarContainerView.centerYAnchor))
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupBindings() {
        viewModel.showCardObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (cardType) in
                guard let self = self else { return }
                self.cardImageView.image = UIImage(named: cardType.imageName)
                self.view.bringSubviewToFront(self.cardImageView)
                self.fakeStatusBarContainerView.isHidden = true
            }).disposed(by: bag)
        
        
        viewModel.secondsTimeObservable
            .observeOn(MainScheduler.instance)
            .map { [weak self] in
                guard let self = self else { return "\($0)" }
                let fakeTime = "\(self.viewModel.currentTimeHours):\(self.viewModel.currentTimeMinutes):\($0)"
                return fakeTime
            }
            .bind(to: timeLabel.rx.text)
            .disposed(by: bag)
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
    
    @objc func didSwipeCardImageView() {
        cardImageView.image = nil
        view.sendSubviewToBack(cardImageView)
        fakeStatusBarContainerView.isHidden = false
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

