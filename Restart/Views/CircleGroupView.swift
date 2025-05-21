//
//  CircleGroupView.swift
//  Restart
//
//  Created by Jhonathan Vidal on 05/13/25.
//

import SwiftUI

struct CircleGroupView: View {
    
    // MARK: - Properties
    
    @State public var shapeColor: Color
    @State public var shapeOpacity: Double
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 40)
                .frame(
                    width: 260, height: 260, alignment: .center
                )
            Circle()
                .stroke(shapeColor.opacity(shapeOpacity), lineWidth: 80)
                .frame(
                    width: 260, height: 260, alignment: .center
                )
        }// ZStack
    }
}

#Preview {
    ZStack{
        Color(.colorBlue)
            .ignoresSafeArea()
        CircleGroupView(
            shapeColor: Color(.white),
            shapeOpacity: 0.2
        )
    }
        
}
