//
//  Sudoku.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/7/22.
//

import Foundation

//typealias Board = [[Int]]
typealias Location = (row: Int, column: Int)

class Sudoku {
    static let shared = Sudoku()
    
    func setNewBoard(difficulty: Difficulty = .easy) -> Board {
        let board = Board.blank()
        
        for row in 0..<Board.limit {
            for column in 0..<Board.limit {
                let location = Location(row,column)
                let possibilities = board.possibilitiesAt(location: location)
                if possibilities.isEmpty {
                    return setNewBoard()
                } else {
                    guard let num = possibilities.randomElement() else {
                        return setNewBoard()
                    }
                    board.set(number: num, at: location)
                }
            }
        }
        
        var locationsRemoved: [Location] = []
        repeat {
            let row = Int.random(in: 0..<Board.limit)
            let column = Int.random(in: 0..<Board.limit)
            let location = Location(row, column)
            if board.numberAt(location: location) != 0 {
                board.set(number: 0, at: location)
                locationsRemoved.append(Location(row,column))
            }
        } while (locationsRemoved.count < difficulty.cellsToClear)
        
        return board
    }
}

class Board {
    var rows: [[Int]] = []
    
    init() {  }
    
    init(difficulty: Difficulty) {
        self.rows = Sudoku.shared.setNewBoard(difficulty: difficulty).rows
    }
    
    init(_ rows: [[Int]]) {
        self.rows = rows
    }
    
    func numberAt(location: Location) -> Int {
        return rows[location.row][location.column]
    }
    
    func set(number: Int, at location: Location) {
        rows[location.row][location.column] = number
    }
}

extension Board {
    static func blank() -> Board {
        let board = Board()
        for row in 0..<limit {
            for column in 0..<limit {
                board.set(number: 0, at: Location(row, column))
            }
        }
        return board
    }
}

extension Board {
    static var limit: Int { 9 }
    
    func isSolvlable() -> Bool {
        let localBoard = self
        for row in 0..<Board.limit {
            for column in 0..<Board.limit {
                if localBoard.numberAt(location: Location(row, column)) == 0 {
                    for num in 0...9 {
                        if number(num, isValidToPlaceAtLocation: (row, column)) {
                            localBoard.set(number: num, at: Location(row, column))
                            
                            if localBoard.isSolvlable() {
                                return true
                            } else {
                                localBoard.set(number: 0, at: Location(row, column))
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
        for row in 0..<Board.limit {
            for column in 0..<Board.limit {
                let location = Location(row, column)
                if self.numberAt(location: location) == number {
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
        [1,2,3,4,5,6,7,8,9].filter { num in
            number(num, isValidToPlaceAtLocation: location)
        }
    }
    
    func prettyPrinted() -> String {
        var board = ""
        for row in 0..<Board.limit {
            for column in 0..<Board.limit {
                board += "\(self.numberAt(location: Location(row, column)))"
                
                if (column + 1) % 3 == 0 && column + 1 != Board.limit {
                    board += "|"
                }
            }
            board += "\n"
            if (row + 1) % 3 == 0 && row + 1 != Board.limit {
                board += "---+---+---\n"
            }
        }
        return board
    }
    
    func solution() -> Board? {
        let localBoard = self
        for row in 0..<Board.limit {
            for column in 0..<Board.limit {
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
        for row in 0..<Board.limit {
            let location = Location(row, column)
            if self.numberAt(location: location) == num {
                return true
            }
        }
        return false
    }
    
    private func number(_ num: Int, isInRow row: Int) -> Bool {
        for column in 0..<Board.limit {
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

enum Difficulty {
    case trivial
    case easy
    case medium
    case hard
    
    var cellsToClear: Int {
        switch self {
        case .easy: return 15
        case .hard: return 30
        case .medium: return 20
        case .trivial: return 10
        }
    }
}
