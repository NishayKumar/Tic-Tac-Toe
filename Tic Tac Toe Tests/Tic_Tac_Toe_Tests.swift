//
//  Tic_Tac_Toe_Tests.swift
//  Tic Tac Toe Tests
//
//  Created by Nishay Kumar on 21/09/23.
//

import XCTest
@testable import Tic_Tac_Toe

final class Tic_Tac_Toe_Tests: XCTestCase {
    let viewModel = GameViewModel()
    func testCheckForDraw_AllNil() {
        // Arrange
        let moves: [Move?] = Array(repeating: nil, count: 9)
        
        // Act
        let isDraw = viewModel.checkForDraw(in: moves)
        
        // Assert
        XCTAssertFalse(isDraw, "Expected not a draw when all elements are nil")
    }
    
    func testCheckForDraw_NotAllNil() {
        // Arrange
        let moves: [Move?] = [nil, Move(player: .human, boardIndex: 1), nil, Move(player: .computer, boardIndex: 3), nil, nil, nil, Move(player: .human, boardIndex: 7), Move(player: .computer, boardIndex: 8)]
        
        // Act
        let isDraw = viewModel.checkForDraw(in: moves)
        
        // Assert
        XCTAssertFalse(isDraw, "Expected not a draw when not all elements are nil")
    }
    
    func testCheckForDraw_NoNil() {
        // Arrange
        let moves: [Move?] = [Move(player: .human, boardIndex: 0), Move(player: .human, boardIndex: 1), Move(player: .human, boardIndex: 2), Move(player: .computer, boardIndex: 3), Move(player: .human, boardIndex: 4), Move(player: .human, boardIndex: 5), Move(player: .human, boardIndex: 6), Move(player: .human, boardIndex: 7), Move(player: .computer, boardIndex: 8)]
        
        // Act
        let isDraw = viewModel.checkForDraw(in: moves)
        
        // Assert
        XCTAssertTrue(isDraw, "Expected a draw when no elements are nil")
    }
}




