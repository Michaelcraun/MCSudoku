//
//  Location.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/10/22.
//

import Foundation

class Location {
    let row: Int
    let column: Int
    var number: Int = 0
    var notes: [Int] = []
    
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

extension Array where Element == Location {
    subscript(_ location: Location) -> Location {
        self.first(where: { $0.row == location.row && $0.column == location.column })!
    }
}
