//
//  HomeView.swift
//  Restart
//
//  Created by Jhonathan Vidal on 05/12/25.
//

import SwiftUI

struct HomeView: View {
    // MARK: - Properties
    
    @AppStorage("onboarding") var isOnboarding: Bool = false
    
    // MARK: - Body
    var body: some View {
        VStack (spacing: 20){
            
            // MARK: - Header
            
            Spacer()
            
            ZStack {
                CircleGroupView(shapeColor: .gray, shapeOpacity: 0.1)
                    
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
            }
            
            // MARK: - Center
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
                .padding()
                
            
            // MARK: - Footer
            
            Spacer()
            
            
            Button {
                isOnboarding = true
            } label: {
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                    
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            
        }// VStack
            
    }
}

#Preview {
    HomeView()
}
