//
//  Location.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/10/22.
//

import Foundation

typealias LocationSolution = Location

class Location {
    let row: Int
    let column: Int
    var number: Int = 0
    var possibilities: [Int] = []
    var impossibilities: [Int] = []
    
    init(_ row: Int, _ column: Int) {
        self.row = row
        self.column = column
    }
    
    func mirror() -> Location {
        let mirrorRow = abs(row - 8)
        let mirrorColumn = abs(column - 8)
        return Location(mirrorRow, mirrorColumn)
    }
    
    func prettyPrinted() -> String {
        "R\(row + 1)C\(column + 1)"
    }
}

extension Array where Element == Location {
    subscript(_ location: Location) -> Location {
        self.first(where: { $0.row == location.row && $0.column == location.column })!
    }
    
    func locationsInBox(containing location: Location) -> [Location] {
        let localColumn = location.column - location.column % 3
        let localRow = location.row - location.row % 3
        var boxLocations: [Location] = []
        
        for row in localRow..<localRow + 3 {
            for column in localColumn..<localColumn + 3 {
                boxLocations.append(self[Location(row, column)])
            }
        }
        
        return boxLocations
    }
    
    func locationsInColumn(containing location: Location) -> [Location] {
        self.filter({ $0.column == location.column })
    }
    
    func locationsInRow(containing location: Location) -> [Location] {
        self.filter({ $0.row == location.row })
    }
}
