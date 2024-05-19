//
//  HeaderView.swift
//  ToDoList
//
//  Created by Sreeja Mugada on 09/05/24.
//

import SwiftUI

struct HeaderView: View {
    var mainText: String
    var subText: String
    var backgroundColor: Color
    var rotationDegrees: Double = 15
    var body: some View {
        ZStack{
            Rectangle().fill(backgroundColor).rotationEffect(.degrees(rotationDegrees))
            VStack{
                Text(mainText).foregroundColor(Color.white).font(.system(size: 40)).bold()
                Text(subText).foregroundColor(Color.white).font(.system(size: 24))
            }.padding(.top, 80)
        }.frame(width: UIScreen.main.bounds.width * 3, height: 350).offset(y: -135)
    }
}

#Preview {
    HeaderView(mainText: "mainText", subText: "subText",backgroundColor: Color.pink)
}
