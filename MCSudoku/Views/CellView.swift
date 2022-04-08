//
//  CellView.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/8/22.
//

import SwiftUI

struct CellView: View {
    var pennedNumber: Int = 0 {
        didSet {
            penciledNumbers.removeAll()
        }
    }
    var penciledNumbers: [Int] = []
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("1")
                        .opacity(penciledNumbers.contains(1) ? 1.0 : 0.0)
                    
                    Text("2")
                        .opacity(penciledNumbers.contains(2) ? 1.0 : 0.0)
                    
                    Text("3")
                        .opacity(penciledNumbers.contains(3) ? 1.0 : 0.0)
                }
                HStack {
                    Text("4")
                        .opacity(penciledNumbers.contains(4) ? 1.0 : 0.0)
                    
                    Text("5")
                        .opacity(penciledNumbers.contains(5) ? 1.0 : 0.0)
                    
                    Text("6")
                        .opacity(penciledNumbers.contains(6) ? 1.0 : 0.0)
                }
                HStack {
                    Text("7")
                        .opacity(penciledNumbers.contains(7) ? 1.0 : 0.0)
                    
                    Text("8")
                        .opacity(penciledNumbers.contains(8) ? 1.0 : 0.0)
                    
                    Text("9")
                        .opacity(penciledNumbers.contains(9) ? 1.0 : 0.0)
                }
            }
            .padding(4)
            
            Text("\(pennedNumber)")
                .opacity(pennedNumber == 0 ? 0.0 : 1.0)
                .font(.title)
                .scaledToFill()
        }
        .font(.system(size: 7))
        .border(Color.black)
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CellView()
            CellView(pennedNumber: 3, penciledNumbers: [])
            CellView(pennedNumber: 0, penciledNumbers: [1,3,6,7,8])
        }
    }
}
