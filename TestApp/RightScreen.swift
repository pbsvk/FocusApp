//
//  RightScreen.swift
//  TestApp
//
//  Created by Bhaskara Padala on 12/4/24.
//

import SwiftUI

struct RightScreen: View {
    @State var activeView: currentView
    var body: some View {
            GeometryReader { bounds in
                VStack {
                    Text("RightView")
                }
                .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
            }
            .background(Color.green)
            .edgesIgnoringSafeArea(.all)
        }
    }
#Preview {
    RightScreen(activeView: .right)
}
