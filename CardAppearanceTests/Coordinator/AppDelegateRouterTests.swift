//
//  AppDelegateRouterTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 8/27/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class AppDelegateRouter: Router {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func present(_ viewController: UIViewController, animated: Bool) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}

class AppDelegateRouterTests: XCTestCase {
    func test_onPresentCall_rootViewcontrollerIsCorrect() {
        let sut = AppDelegateRouter(window: UIWindow())
        let mockVC = MockViewController()
        
        sut.present(mockVC, animated: false)
        
        XCTAssertEqual(sut.window.rootViewController, mockVC)
    }
    
    func test_onPresentCall_isKeyWindow() {
        let sut = AppDelegateRouter(window: UIWindow())
        
        sut.present(MockViewController(), animated: false)
        
        XCTAssertTrue(sut.window.isKeyWindow)
    }
    
    private class MockViewController: UIViewController {}
}

