//
//  ControlButton.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/8/22.
//

import SwiftUI

struct ControlButton: View {
    @State var text: String = ""
    @State var isPressed: Bool = false
    @State var maxWidth: CGFloat = .infinity
    
    var body: some View {
        Text(text)
            .frame(minWidth: 20, maxWidth: maxWidth, maxHeight: 20)
            .padding(4)
            .background(Color.gray)
            .border(Color.black, width: 2)
            .cornerRadius(4)
            .opacity(isPressed ? 1.0 : 0.5)
            .onTapGesture {
                isPressed.toggle()
            }
    }
}

struct ControlButton_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ControlButton(text: "1", isPressed: false, maxWidth: 20)
            ControlButton(text: "2", isPressed: true, maxWidth: 20)
            ControlButton(text: "3", isPressed: true, maxWidth: .infinity)
        }
        .padding()
    }
}
