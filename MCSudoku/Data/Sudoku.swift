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
    
    let limit: Int = 9
}
