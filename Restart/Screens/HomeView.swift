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
    @State private var isAnimating: Bool = false
    
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
                    .offset(y: isAnimating ? 35 : -35)
                    .animation(.easeOut(duration: 1).repeatForever(), value: isAnimating)
            } // ZStack
            
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
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboarding = true
                    
                }
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
        .onAppear {
            //
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isAnimating.toggle()
            }
        }
            
    }
}

#Preview {
    HomeView()
}
