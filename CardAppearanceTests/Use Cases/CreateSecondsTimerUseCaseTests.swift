//
//  CreateSecondsTimerUseCaseTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 6/13/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class CreateSecondsTimerUseCaseTests: XCTestCase {
    
    var sut: CreateSecondsTimerUseCase!
    
    override func setUp() {
        sut = CreateSecondsTimerUseCase()
    }
    
    override func tearDown() {
        sut = nil
    }

}
