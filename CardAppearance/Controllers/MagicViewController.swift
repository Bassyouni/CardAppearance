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

class MagicViewController: UIViewController, UIGestureRecognizerDelegate {
    
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
        cardImageView.contentMode = .scaleAspectFill
        cardImageView.isUserInteractionEnabled = true
//        let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeCardImageView))
//        let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeCardImageView))
//        leftSwipeGesture.direction = .left
//        rightSwipeGesture.direction = .right
//        cardImageView.addGestureRecognizer(leftSwipeGesture)
//        cardImageView.addGestureRecognizer(rightSwipeGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
    
        cardImageView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        gesture.delegate = self
        switch gesture.state {
        case .changed:
            let translation = gesture.translation(in: view)
            
            cardImageView.center = .init(x: view.center.x + translation.x, y:  cardImageView.center.y )
            print(translation)
            
        case .ended:
            self.didSwipeCardImageView()
        
         default:
            return
        }
    }
    
    
    private func addTapActionsForQuadrants() {
        topLeadingButton.addTarget(self, action: #selector(didTapTopLeadingQuadrant), for: .touchUpInside)
        topTrailingButton.addTarget(self, action: #selector(didTapTopTrailingQuadrant), for: .touchUpInside)
        bottomLeadingButton.addTarget(self, action: #selector(didTapBottomLeadingQuadrant), for: .touchUpInside)
        bottomTrailingButton.addTarget(self, action: #selector(didTapBottomTrailingQuadrant), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        cardImageView.fillSuperview(padding: .init(top: 71, left: 0, bottom: 71, right: 0))
        
        topLeadingButton.equalWidthAndHeight(to: view, multiplier: 0.5)
        topTrailingButton.equalWidthAndHeight(to: view, multiplier: 0.5)
        bottomLeadingButton.equalWidthAndHeight(to: view, multiplier: 0.5)
        bottomTrailingButton.equalWidthAndHeight(to: view, multiplier: 0.5)
        
        topLeadingButton.anchor(top: view.topAnchor, leading: view.leadingAnchor)
        topTrailingButton.anchor(top: view.topAnchor, trailing: view.trailingAnchor)
        bottomLeadingButton.anchor(leading: view.leadingAnchor, bottom: view.bottomAnchor)
        bottomTrailingButton.anchor(bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    
        fakeStatusBarContainerView.anchor(top: view.topAnchor,
                                          leading: view.leadingAnchor,
                                          trailing: view.trailingAnchor,
                                          size: CGSize(width: 0, height: UIApplication.shared.statusBarFrame.height))
        
        timeLabel.anchor(leading: view.leadingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 0))
        timeLabel.centerYAnchor.constraint(equalTo: fakeStatusBarContainerView.centerYAnchor).isActive = true
        
        batteryView.anchor(trailing: view.trailingAnchor,
                           padding: .init(top: 0, left: 0, bottom: 0, right: 15),
                           size: CGSize(width: 25, height: 20))
        batteryView.centerYAnchor.constraint(equalTo: fakeStatusBarContainerView.centerYAnchor).isActive = true
    }
    
    private func setupBindings() {
        viewModel.showCardObservable
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (cardType) in
                self?.showCard(ofType: cardType)
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
    
    func showCard(ofType card: CardType) {
        cardImageView.image = UIImage(named: card.imageName)
        view.bringSubviewToFront(cardImageView)
        fakeStatusBarContainerView.isHidden = true
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
