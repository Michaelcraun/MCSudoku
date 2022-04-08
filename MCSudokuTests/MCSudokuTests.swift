//
//  MCSudokuTests.swift
//  MCSudokuTests
//
//  Created by Michael Craun on 4/7/22.
//

import XCTest
@testable import MCSudoku

class MCSudokuTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    var testBoard: Board {
        return Board(
            [[2,7,3,9,0,0,5,1,0],
             [0,0,0,8,5,0,0,9,3],
             [9,0,5,2,1,0,4,0,6],
             [0,0,7,4,0,9,0,5,0],
             [4,0,9,0,8,1,6,3,0],
             [6,0,8,0,0,0,0,0,9],
             [8,3,1,0,0,0,0,0,0],
             [0,9,6,0,0,0,3,0,0],
             [0,0,0,0,0,0,0,6,0]]
        )
    }
    
    func testNewBoard() {
        let expected = "000|000|000\n000|000|000\n000|000|000\n---+---+---\n000|000|000\n000|000|000\n000|000|000\n---+---+---\n000|000|000\n000|000|000\n000|000|000\n"
        let newBoard = Board.blank()
        XCTAssertEqual(newBoard.prettyPrinted(), expected)
    }
    
    func testIsSolvable() {
        XCTAssertTrue(testBoard.isSolvlable())
    }
    
    func testSolution() {
        let expected = "273|940|510\n000|850|093\n905|210|406\n---+---+---\n007|409|050\n409|081|630\n608|000|009\n---+---+---\n831|000|000\n096|000|300\n000|000|060\n"
        XCTAssertEqual(testBoard.solution()?.prettyPrinted(), expected)
    }
    
    func testPossibilitiesAtLocation() {
        XCTAssertEqual(testBoard.possibilitiesAt(location: Location(0,4)), [4,6])
    }
    
    func testGeneration() {
        let easyBoard = Sudoku.shared.setNewBoard()
        let trivialBoard = Sudoku.shared.setNewBoard(difficulty: .trivial)
        let mediumBoard = Sudoku.shared.setNewBoard(difficulty: .medium)
        let hardBoard = Sudoku.shared.setNewBoard(difficulty: .hard)
        
        XCTAssertTrue(easyBoard.isSolvlable())
        XCTAssertEqual(easyBoard.locationsOf(number: 0).count, 15)
        
        XCTAssertTrue(trivialBoard.isSolvlable())
        XCTAssertEqual(trivialBoard.locationsOf(number: 0).count, 10)
        
        print(mediumBoard.prettyPrinted())
        
        XCTAssertTrue(mediumBoard.isSolvlable())
        XCTAssertEqual(mediumBoard.locationsOf(number: 0).count, 20)
        
        XCTAssertTrue(hardBoard.isSolvlable())
        XCTAssertEqual(hardBoard.locationsOf(number: 0).count, 30)
    }
}
