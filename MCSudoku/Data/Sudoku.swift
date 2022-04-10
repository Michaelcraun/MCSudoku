//
//  Sudoku.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/7/22.
//

import Foundation

class Sudoku {
    static let shared = Sudoku()
    
    let limit: Int = 9
}

struct Location {
    let row: Int
    let column: Int
    
    init(_ row: Int, _ column: Int) {
        self.row = row
        self.column = column
    }
    
    func mirror() -> Location {
        let mirrorRow = abs(row - 8)
        let mirrorColumn = abs(column - 8)
        return Location(mirrorRow, mirrorColumn)
    }
}
