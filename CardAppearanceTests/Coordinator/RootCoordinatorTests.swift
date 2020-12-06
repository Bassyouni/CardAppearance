//
//  RootCoordinatorTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 8/27/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class RootCoordinatorTests: XCTestCase {
    
    func test_onPresent_MagicScreenTypeVCIsRootViewController() {
        let (spy, sut) = makeSUT()
        
        sut.present(animated: false)
        
        XCTAssert(spy.controller is MagicScreenTypeViewController)
    }
    
    func test_didChooseEmptyScreen_navigatesToMagicViewController() {
        let (spy, sut) = makeSUT()
        
        sut.didChooseEmptyScreen()
        
        XCTAssert(spy.controller is MagicViewController)
    }
    
    func test_didChooseEmptyScreen_navigatesWithAnimation() {
        let (spy, sut) = makeSUT()
        
        sut.didChooseEmptyScreen()
        
        XCTAssertTrue(spy.isAnimated!)
    }
    
    func test_didChoosWithCardScreen_navigatesToBackCardMagicController() {
        let (spy, sut) = makeSUT()
        
        sut.didChooseScreenWithCard()
        
        XCTAssert(spy.controller is BackCardMagicVC)
    }
    
    func test_didChoosWithCardScreen_navigatesWithAnimation() {
        let (spy, sut) = makeSUT()
        
        sut.didChooseScreenWithCard()
        
        XCTAssertTrue(spy.isAnimated!)
    }
    
    // MARK: - Helpers
    private func makeSUT() -> (spy: RouterSpy, sut: RootCoordinator) {
        let spy = RouterSpy()
        let sut = RootCoordinator(router: spy)
        return (spy, sut)
    }
    
    final class RouterSpy: Router {
        var controller: UIViewController?
        var isAnimated: Bool?
        
        func present(_ viewController: UIViewController, animated: Bool) {
            self.controller = viewController
            self.isAnimated = animated
        }
    }
}
