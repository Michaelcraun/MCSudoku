//
//  SwiftUIView.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/7/22.
//

import SwiftUI

struct GridView: View {
    private let rows: Int = 9
    private let columns: Int = 9
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                VStack(spacing: 0) {
                    ForEach(0..<9) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<9) { column in
                                Rectangle()
                                    .fill(Color.white)
                                    .border(Color.black)
                                    .frame(
                                        width: geo.size.width / 9,
                                        height: geo.size.width / 9)
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
            .border(Color.black, width: 3)
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
    }
}
