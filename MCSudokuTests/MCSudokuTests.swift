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
        )!
    }
    
    func testNewBoard() {
        let expected = "000|000|000\n000|000|000\n000|000|000\n---+---+---\n000|000|000\n000|000|000\n000|000|000\n---+---+---\n000|000|000\n000|000|000\n000|000|000\n"
        let newBoard = Board()
        XCTAssertEqual(newBoard.prettyPrinted(), expected)
    }
    
    func testIsSolvable() {
        XCTAssertTrue(testBoard.isSolvlable())
    }
    
    func testSolution() {
        let expected = "273|946|518\n164|857|293\n985|213|476\n---+---+---\n317|469|852\n429|581|637\n658|372|149\n---+---+---\n831|694|725\n796|125|384\n542|738|961\n"
        XCTAssertEqual(testBoard.solution()?.prettyPrinted(), expected)
    }
    
    func testPossibilitiesAtLocation() {
        XCTAssertEqual(testBoard.possibilitiesAt(location: Location(0,4)), [4,6])
    }
    
    func testTrivialGeneration() {
        let trivialBoard = Board(difficulty: .trivial)
        XCTAssertTrue(trivialBoard.isSolvlable())
        XCTAssertEqual(trivialBoard.locationsOf(number: 0).count, 10)
    }
    
    func testEasyGeneration() {
        let easyBoard = Board(difficulty: .easy)
        XCTAssertTrue(easyBoard.isSolvlable())
        XCTAssertEqual(easyBoard.locationsOf(number: 0).count, 15)
    }
    
    func testMediumGeneration() {
        let mediumBoard = Board(difficulty: .medium)
        XCTAssertTrue(mediumBoard.isSolvlable())
        XCTAssertEqual(mediumBoard.locationsOf(number: 0).count, 20)
    }
    
    func testHardGeneration() {
        let hardBoard = Board(difficulty: .hard)
        XCTAssertTrue(hardBoard.isSolvlable())
        XCTAssertEqual(hardBoard.locationsOf(number: 0).count, 30)
    }
    
    func testMirrorPairs() {
        for _ in 0..<20 {
            let row = Int.random(in: 0..<Sudoku.shared.limit)
            let column = Int.random(in: 0..<Sudoku.shared.limit)
            let location = Location(row, column)
            let mirrorLocation = location.mirror()
            print("The mirror pair of \(location) is \(mirrorLocation)")
        }
    }
}
