//
//  MagicViewModelTests.swift
//  CardAppearanceTests
//
//  Created by Omar Bassyouni on 5/31/20.
//  Copyright © 2020 Omar Bassyouni. All rights reserved.
//

import XCTest
@testable import CardAppearance

class MagicViewModelTests: XCTestCase {
    
    var sut: MagicViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = MagicViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    // MARK: - Quadrent Actions
    func testWhenTopLeadingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapTopLeadingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isTopLeadingQuadrantTapped)
    }
    
    func testWhenTopTrailingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapTopTrailingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isTopTrailingQuadrantTapped)
    }
    
    func testWhenBottomLeadingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapBottomLeadingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isBottomLeadingQuadrantTapped)
    }
    
    func testWhenBottomTrailingQuadrantTapped_viewModelNotified() {
        // when
        sut.didTapBottomTrailingQuadrant()
        
        // then
//        XCTAssertTrue(mockViewModel.isBottomTrailingQuadrantTapped)
    }
    
    
    // MARK: - Time Fetching
    func testFetchingCurrentTimeInHours_returnsCurrentTime() {
        // when
        let currentHours = sut.currentTimeHours
        
        // given
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        // then
        XCTAssertEqual(currentHours, hour)
    }
    
    func testFetchingCurrentTimeInMinutes_returnsCurrentTime() {
        // when
        let currentMinutes = sut.currentTimeMinutes
        
        // given
        let date = Date()
        let calendar = Calendar.current
        let minutes = calendar.component(.minute, from: date)
        
        // then
        XCTAssertEqual(currentMinutes, minutes)
    }
}

