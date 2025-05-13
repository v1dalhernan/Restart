//
//  OnboardingView.swift
//  Restart
//
//  Created by Jhonathan Vidal on 05/12/25.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTIES
    @AppStorage("onboarding") var isOnboarding: Bool = true // esto solo es valido si no tiene un valor por defecto
    
    
    // MARK: - BODY
    var body: some View {
        VStack (spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                // Action to perform when button is tapped
                isOnboarding = false 
            } label: {
                Text("Start")
            }
        } // VStack
        
            
    }
}

#Preview {
    OnboardingView()
}
