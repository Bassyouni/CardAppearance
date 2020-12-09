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
    
    func testCardImageView_whenImagePannedOfScreen_cardImageIsHidden() {
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        sut.didEndPanningCardOfScreen()
        
        let cardImageView = sut.view.subviews.first as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertNil(cardImageView?.image)
    }
    
    func testFakeStatusBar_whenShowingSelectedCard_fakeStatusBarIsHidden() {        
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        XCTAssertTrue(sut.fakeStatusBarContainerView.isHidden)
    }
    
    func testFakeStatusBar_whenImagePannedOfScreen_fakeStatusBarIsVisible() {
        let (sut, mockViewModel) = makeSUT()
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        
        sut.didEndPanningCardOfScreen()
        
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
        
        panGesture.performPan(forState: .began, translation: .init(x: 33, y: 23))
        AssertCardImageDidntMove(sut)
        
        panGesture.performPan(forState: .possible)
        AssertCardImageDidntMove(sut)
        
        panGesture.performPan(forState: .began)
        AssertCardImageDidntMove(sut)
        
        panGesture.performPan(forState: .failed)
        AssertCardImageDidntMove(sut)
    }
    
    func test_gestureIsVertical_cardDoesNotPan() {
        let (sut, _) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        sut.showCard(ofType: .aceOfClubs)
        panGesture.performPan(forState: .changed, translation: .init(x: 0, y: 50))
        
        AssertCardImageDidntMove(sut)
    }
    
    func test_gestureIsHorizontol_cardPans() {
        let (sut, _) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        panGesture.performPan(forState: .changed, translation: .init(x: 88, y: 0))
        
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 88)
        XCTAssertEqual(sut.cardImageConstrants?.trailing?.constant, 88)
    }
    
    func test_gestureIsPannedCallBackCAllMultipleTimes_cardConstraintsUpdatesCorrectyl() {
        let (sut, _) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        panGesture.performPan(forState: .changed, translation: .init(x: 20, y: 0))
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 20)
        XCTAssertEqual(sut.cardImageConstrants?.trailing?.constant, 20)
    
        panGesture.performPan(forState: .changed, translation: .init(x: 50, y: 0))
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 70)
        XCTAssertEqual(sut.cardImageConstrants?.trailing?.constant, 70)
        
        panGesture.performPan(forState: .changed, translation: .init(x: -10, y: 0))
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 60)
        XCTAssertEqual(sut.cardImageConstrants?.trailing?.constant, 60)
    }
    
    func test_gestureIsEnded_cardImageIsResetedAndHidden() {
        let (sut, mockViewModel) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        panGesture.performPan(forState: .changed, translation: .init(x: 88, y: 0))
        panGesture.performPan(forState: .ended)
        
        let cardImageView = sut.view.subviews.first as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertNil(cardImageView?.image)
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 0)
        XCTAssertEqual(sut.cardImageConstrants?.trailing?.constant, 0)
    }
    
    func test_gestureIsCancelled_cardImageIsResetedAndHidden() {
        let (sut, mockViewModel) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        mockViewModel.showCardSubject.onNext(.aceOfClubs)
        panGesture.performPan(forState: .changed, translation: .init(x: 88, y: 0))
        panGesture.performPan(forState: .cancelled)
        
        let cardImageView = sut.view.subviews.first as? UIImageView
        XCTAssertNotNil(cardImageView)
        XCTAssertNil(cardImageView?.image)
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 0)
        XCTAssertEqual(sut.cardImageConstrants?.trailing?.constant, 0)
    }
    
    func test_gestureIsPanned_setsTranslationToZero() {
        let (sut, _) = makeSUT()
        let panGesture = getCardPanGesture(from: sut)
        
        XCTAssertEqual(panGesture.translationsSet.count, 0)
        panGesture.performPan(forState: .changed, translation: .init(x: 88, y: 0))
        
        XCTAssertEqual(panGesture.translationsSet.count, 1)
        XCTAssertEqual(panGesture.translationsSet[0].translation, .zero)
        XCTAssertEqual(panGesture.translationsSet[0].view, sut.view)
        
        panGesture.performPan(forState: .changed, translation: .init(x: 12, y: 0))
        
        XCTAssertEqual(panGesture.translationsSet.count, 2)
        XCTAssertEqual(panGesture.translationsSet[1].translation, .zero)
        XCTAssertEqual(panGesture.translationsSet[1].view, sut.view)
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
    
    private func AssertCardImageDidntMove(_ sut: MagicViewController) {
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 0)
        XCTAssertEqual(sut.cardImageConstrants?.leading?.constant, 0)
    }
    
    class TestableUIPanGestureRecognizer: UIPanGestureRecognizer {
        let target: Any?
        let action: Selector?
        
        var translationsSet = [(translation: CGPoint, view: UIView?)]()
        
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
        
        override func setTranslation(_ translation: CGPoint, in view: UIView?) {
            translationsSet.append((translation, view))
            super.setTranslation(translation, in: view)
        }
    }
}
