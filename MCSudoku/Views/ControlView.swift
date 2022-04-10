//
//  ControlView.swift
//  MCSudoku
//
//  Created by Michael Craun on 4/8/22.
//

import SwiftUI

struct ControlView: View {
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("1")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Text("2")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Text("3")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Text("4")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Text("5")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Spacer()
                }
                HStack {
                    Text("6")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Text("7")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Text("8")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Text("9")
                        .frame(width: 20, height: 20)
                        .padding(4)
                        .background(Color.gray)
                        .cornerRadius(4)
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding(4)
        }
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView()
    }
}
