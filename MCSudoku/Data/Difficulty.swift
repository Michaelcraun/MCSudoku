//
//  Difficulty.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/8/22.
//

import Foundation

enum Difficulty {
    case custom
    case none
    
    case trivial
    case easy
    case medium
    case hard
    
    var cellsToClear: Int {
        switch self {
        case .custom: return 0
        case .easy: return 30
        case .hard: return 60
        case .medium: return 50
        case .none: return 0
        case .trivial: return 20
        }
    }
}
