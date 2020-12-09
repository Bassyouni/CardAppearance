//
//  MagicViewControllerTests.swift
//  MagicViewControllerTests
//
//  Created by Omar Bassyouni on 5/14/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class MagicViewControllerTests: XCTestCase {
    
    // MARK: - Quadrent Actions
    func testWhenTopLeadingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapTopLeadingQuadrant()
        
        XCTAssertTrue(mockViewModel.isTopLeadingQuadrantTapped)
    }
    
    func testWhenTopTrailingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapTopTrailingQuadrant()
        
        XCTAssertTrue(mockViewModel.isTopTrailingQuadrantTapped)
    }
    
    func testWhenBottomLeadingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapBottomLeadingQuadrant()
        
        XCTAssertTrue(mockViewModel.isBottomLeadingQuadrantTapped)
    }
    
    func testWhenBottomTrailingQuadrantTapped_viewModelNotified() {
        let (sut, mockViewModel) = makeSUT()
        
        sut.didTapBottomTrailingQuadrant()
        
        XCTAssertTrue(mockViewModel.isBottomTrailingQuadrantTapped)
    }
    
    // MARK: - Appearance
    func testStatusBarIsHidden() {
        XCTAssertTrue(makeSUT().sut.prefersStatusBarHidden)
    }
    
    func testFakeStatusBarIsVisible() {
        XCTAssertFalse(makeSUT().sut.fakeStatusBarContainerView.isHidden)
    }
    
    // MARK: - Card Appearance Behaviours
    func testCardImageView_whenShowingSelectedCard_cardImageIsOnTopVisible() {
        let (sut, mockViewModel) = makeSUT()
        let cardSelected = CardType.aceOfClubs
        let cardImage = UIImage(named: cardSelected.imageName)
        
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        let cardImageView = sut.view.subviews.last as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertEqual(cardImageView?.image?.pngData(), cardImage?.pngData())
    }
    
    func testCardImageView_whenImageTapped_cardImageIsHidden() {
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        sut.didSwipeCardImageView()
        
        let cardImageView = sut.view.subviews.first as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertNil(cardImageView?.image)
    }
    
    func testFakeStatusBar_whenShowingSelectedCard_fakeStatusBarIsHidden() {        
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        XCTAssertTrue(sut.fakeStatusBarContainerView.isHidden)
    }
    
    func testFakeStatusBar_whenCardImageTapped_fakeStatusBarIsVisible() {
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        sut.didSwipeCardImageView()
        
        XCTAssertFalse(sut.fakeStatusBarContainerView.isHidden)
    }
    
    func testIdleTimer_whenViewIsVisible_isDisabled() {
        let (sut, _) = makeSUT()
        
        sut.beginAppearanceTransition(true, animated: false)
        sut.endAppearanceTransition()
        
        XCTAssertTrue(UIApplication.shared.isIdleTimerDisabled)
    }
    
    func testIdleTimer_whenViewDisappears_isNotDisabled() {
        var (sut, _): (MagicViewController?, MagicViewModelMock?) = makeSUT()
        
        sut?.beginAppearanceTransition(false, animated: false)
        sut?.endAppearanceTransition()
        sut = nil
        
        XCTAssertFalse(UIApplication.shared.isIdleTimerDisabled)
    }
    
    // MARK: - Pan Gesture Tests
    func test_viewDidLoad_cardImageHasPanGesture() {
        let (sut, _) = makeSUT()
        
        XCTAssertNotNil(sut.cardImageView.gestureRecognizers)
        XCTAssertEqual(sut.cardImageView.gestureRecognizers?.contains { $0 is TestableUIPanGestureRecognizer }, true)
    }
    
    func test_gestureStateIsNotChangedOrEndedOrCancelled_doesNothing() {
        let (sut, _) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        let originalCardCenter = sut.cardImageView.center
        
        panGesture.performPan(forState: .began, translation: .init(x: 33, y: 23))
        XCTAssertEqual(sut.cardImageView.center, originalCardCenter)
        
        panGesture.performPan(forState: .possible)
        XCTAssertEqual(sut.cardImageView.center, originalCardCenter)
        
        panGesture.performPan(forState: .began)
        XCTAssertEqual(sut.cardImageView.center, originalCardCenter)
        
        panGesture.performPan(forState: .failed)
        XCTAssertEqual(sut.cardImageView.center, originalCardCenter)
    }
    
    func test_gestureIsVertical_cardDoesNotPan() {
        let (sut, _) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        let originalCardCenter = sut.view.center
        
        sut.showCard(ofType: .aceOfClubs)
        panGesture.performPan(forState: .changed, translation: .init(x: 0, y: 50))
        
        XCTAssertEqual(sut.cardImageView.center, originalCardCenter)
    }
    
    func test_gestureIsHorizontol_cardPans() {
        let (sut, _) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        let originalCardCenter = sut.view.center
        
        panGesture.performPan(forState: .changed, translation: .init(x: 88, y: 0))
        
        XCTAssertEqual(sut.cardImageView.center.x, originalCardCenter.x + 88)
        XCTAssertEqual(sut.cardImageView.center.y, originalCardCenter.y)
    }
    
    func test_gestureIsEnded_cardImageIsHidden() {
        let (sut, mockViewModel) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        panGesture.performPan(forState: .changed, translation: .init(x: 88, y: 0))
        panGesture.performPan(forState: .ended)
        
        let cardImageView = sut.view.subviews.first as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertNil(cardImageView?.image)
    }
    
    func test_gestureIsCancelled_cardImageIsHidden() {
        let (sut, mockViewModel) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        panGesture.performPan(forState: .changed, translation: .init(x: 88, y: 0))
        panGesture.performPan(forState: .cancelled)
        
        let cardImageView = sut.view.subviews.first as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertNil(cardImageView?.image)
    }
    
    // MARK: - Helpers
    private func makeSUT() -> (sut: MagicViewController, mockViewModel: MagicViewModelMock) {
        let mockViewModel = MagicViewModelMock()
        let sut = MagicViewController(viewModel: mockViewModel)
        sut.cardPanGesture = TestableUIPanGestureRecognizer(target: sut, action: #selector(sut.handleCardPan(_:)))
        _ = sut.view
        sut.view.setNeedsLayout()
        sut.view.layoutIfNeeded()
        return (sut, mockViewModel)
    }
    
    private func getCardPanGesture(from sut: MagicViewController) -> TestableUIPanGestureRecognizer {
        return sut.cardPanGesture as! TestableUIPanGestureRecognizer
    }
    
    class TestableUIPanGestureRecognizer: UIPanGestureRecognizer {
        let target: Any?
        let action: Selector?
        
        var savedTranslation: CGPoint?
        private var savedState: UIGestureRecognizer.State?
        
        override init(target: Any?, action: Selector?) {
            self.target = target
            self.action = action
            super.init(target: target, action: action)
        }
        
        func performPan(forState state: UIGestureRecognizer.State, translation: CGPoint = .zero) {
            guard let target = target else { return }
            setTranslation(translation)
            self.state = state
            _ = (target as AnyObject).perform(action, with: self)
        }
        
        override func translation(in view: UIView?) -> CGPoint {
            if let savedTranslation = savedTranslation {
                return savedTranslation
            }
            return super.translation(in: view)
        }
        
        func setTranslation(_ point: CGPoint) {
            self.savedTranslation = point
        }
        
        override var state: UIGestureRecognizer.State {
            set {
                self.savedState = newValue
            }
            get {
                if let savedState = savedState {
                    return savedState
                }
                return super.state
            }
        }
    }
}
