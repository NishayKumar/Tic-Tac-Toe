//
//  Tic_Tac_Toe_Tests.swift
//  Tic Tac Toe Tests
//
//  Created by Nishay Kumar on 21/09/23.
//

import XCTest
@testable import Tic_Tac_Toe

final class Tic_Tac_Toe_Tests: XCTestCase {
    var viewModel: GameViewModel!
    func testCheckForDraw_AllNil() {
        // Arrange
        let moves: [Move?] = Array(repeating: nil, count: 9)
        
        // Act
        let isDraw = viewModel.checkForDraw(in: moves)
        
        // Assert
//        XCTAssertTrue(isDraw, "Expected a draw when all elements are nil")
        XCTAssertNil(isDraw)
    }
    
    func testCheckForDraw_NotAllNil() {
        // Arrange
        let moves: [Move?] = [nil, Move(player: .human, boardIndex: 1), nil, Move(player: .computer, boardIndex: 3), nil, nil, nil, Move(player: .human, boardIndex: 7), Move(player: .computer, boardIndex: 8)]
        let viewModel = GameViewModel()
        
        // Act
        let isDraw = viewModel.checkForDraw(in: moves)
        
        // Assert
        XCTAssertFalse(isDraw, "Expected not a draw when not all elements are nil")
    }
}
