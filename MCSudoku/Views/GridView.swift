//
//  SwiftUIView.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/7/22.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var board: Board
    
    var body: some View {
        HStack {
            VStack(spacing: 0) {
                ForEach(0..<Sudoku.shared.limit) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<Sudoku.shared.limit) { column in
                            CellView(pennedNumber: board.numberAt(location: Location(row, column)), penciledNumbers: [])
                                .onTapGesture {
                                    // Interaction with cell like:
                                    // - Insert penned num
                                    // - Insert penciled num
                                    // - Clear cell
                                }
                        }
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(board: Board(difficulty: .trivial))
    }
}
