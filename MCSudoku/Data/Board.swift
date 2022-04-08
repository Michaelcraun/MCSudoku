//
//  Board.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/8/22.
//

import Foundation

class Board: ObservableObject {
    var difficulty: Difficulty = .easy
    var rows: [[Int]] = []
    var userInput: [[Int]] = []
    var userNotes: [[Int]] = []
    
    /// An initialier for creating a completely blank sudoku board. Will mostly be used for creating custom boards.
    init() {
        self.difficulty = .none
        self.rows = Board.emptyRows()
    }
    
    /// An initializer for creating a sudoku board of a specific difficulty.
    init(difficulty: Difficulty) {
        self.difficulty = difficulty
        self.rows = Board.emptyRows()
        self.setBoard()
    }
    
    /// An optional initializer for creating a board with a custom set of rows. To use this initializer, it must be passed
    /// an two-dimensional array of Int values that contains 9 sets of integers. In addition, each row must have 9
    /// values and each value contained must be between 1 and 9 inclusive. Otherwise, this initializer will fail.
    init?(_ rows: [[Int]]) {
        guard rows.count == 9 else { return nil }
        for row in rows {
            guard row.count == 9 else { return nil }
            for num in row {
                guard num < 10 && num > 0 else { return nil }
            }
        }
        self.difficulty = .custom
        self.rows = rows
    }
    
    func numberAt(location: Location) -> Int {
        rows[location.row][location.column]
    }
    
    func set(number: Int, at location: Location) {
        rows[location.row][location.column] = number
    }
}

extension Board {
    /// A helper funciton to easily create a completely blank puzzle board. This function creates a two-dimensional
    /// array of Int values that has 9 arrays of 9 0 Int values.
    static func emptyRows() -> [[Int]] {
        var rows: [[Int]] = []
        for _ in 0..<Sudoku.shared.limit {
            var row: [Int] = []
            for _ in 0..<Sudoku.shared.limit {
                row.append(0)
            }
            rows.append(row)
        }
        return rows
    }
}

extension Board {
    func isSolvlable() -> Bool {
        for row in 0..<Sudoku.shared.limit {
            for column in 0..<Sudoku.shared.limit {
                let location = Location(row, column)
                if numberAt(location: location) == 0 {
                    for num in 0...9 {
                        if number(num, isValidToPlaceAtLocation: (row, column)) {
                            set(number: num, at: location)
                            
                            if isSolvlable() {
                                set(number: 0, at: location)
                                return true
                            } else {
                                set(number: 0, at: location)
                            }
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func locationsOf(number: Int) -> [Location] {
        var locations: [Location] = []
        for row in 0..<Sudoku.shared.limit {
            for column in 0..<Sudoku.shared.limit {
                let location = Location(row, column)
                if numberAt(location: location) == number {
                    locations.append(location)
                }
            }
        }
        return locations
    }
    
    func number(_ num: Int, isValidToPlaceAtLocation location: Location) -> Bool {
        return !number(num, isInRow: location.row) &&
            !number(num, isInColumn: location.column) &&
            !number(num, isInBoxAtLocation: location)
    }
    
    func possibilitiesAt(location: Location) -> [Int] {
        [1,2,3,4,5,6,7,8,9].filter { number($0, isValidToPlaceAtLocation: location) }
    }
    
    func prettyPrinted() -> String {
        var board = ""
        for row in 0..<Sudoku.shared.limit {
            for column in 0..<Sudoku.shared.limit {
                board += "\(numberAt(location: Location(row, column)))"
                
                if (column + 1) % 3 == 0 && column + 1 != Sudoku.shared.limit {
                    board += "|"
                }
            }
            board += "\n"
            if (row + 1) % 3 == 0 && row + 1 != Sudoku.shared.limit {
                board += "---+---+---\n"
            }
        }
        return board
    }
    
    func setBoard() {
        for row in 0..<Sudoku.shared.limit {
            for column in 0..<Sudoku.shared.limit {
                let location = Location(row,column)
                let possibilities = possibilitiesAt(location: location)
                guard let num = possibilities.randomElement(), !possibilities.isEmpty else {
                    rows = Board.emptyRows()
                    return setBoard()
                }
                set(number: num, at: location)
            }
        }
        
        var locationsRemoved: [Location] = []
        repeat {
            let row = Int.random(in: 0..<Sudoku.shared.limit)
            let column = Int.random(in: 0..<Sudoku.shared.limit)
            let location = Location(row, column)
            if numberAt(location: location) != 0 {
                set(number: 0, at: location)
                locationsRemoved.append(Location(row,column))
            }
        } while (locationsRemoved.count < difficulty.cellsToClear)
    }
    
    func solution() -> Board? {
        let localBoard = self
        for row in 0..<Sudoku.shared.limit {
            for column in 0..<Sudoku.shared.limit {
                let location = Location(row, column)
                if localBoard.numberAt(location: location) == 0 {
                    for num in 0...9 {
                        if number(num, isValidToPlaceAtLocation: location) {
                            localBoard.set(number: num, at: location)
                            
                            if localBoard.isSolvlable() {
                                return localBoard
                            } else {
                                localBoard.set(number: 0, at: location)
                            }
                        }
                    }
                    return nil
                }
            }
        }
        return localBoard
    }
    
    private func number(_ num: Int, isInColumn column: Int) -> Bool {
        for row in 0..<Sudoku.shared.limit {
            let location = Location(row, column)
            if self.numberAt(location: location) == num {
                return true
            }
        }
        return false
    }
    
    private func number(_ num: Int, isInRow row: Int) -> Bool {
        for column in 0..<Sudoku.shared.limit {
            let location = Location(row, column)
            if self.numberAt(location: location) == num {
                return true
            }
        }
        return false
    }
    
    private func number(_ num: Int, isInBoxAtLocation location: Location) -> Bool {
        let localColumn = location.column - location.column % 3
        let localRow = location.row - location.row % 3
        
        for row in localRow..<localRow + 3 {
            for column in localColumn..<localColumn + 3 {
                let location = Location(row, column)
                if self.numberAt(location: location) == num {
                    return true
                }
            }
        }
        return false
    }
}
