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
    func test_didChooseEmptyScreen_navigatesToMagicViewController() {
        let (spy, sut) = makeSUT()
        
        sut.didChooseEmptyScreenDelegateNotified()
        
        XCTAssert(spy.controller is MagicViewController)
    }
    
    func test_didChooseEmptyScreen_navigatesWithAnimation() {
        let (spy, sut) = makeSUT()
        
        sut.didChooseEmptyScreenDelegateNotified()
        
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
