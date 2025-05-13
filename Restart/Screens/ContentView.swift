//
//  ContentView.swift
//  Restart
//
//  Created by Jhonathan Vidal on 05/12/25.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboarding: Bool = true
    
    
    var body: some View {
        ZStack {
            if isOnboarding {
                OnboardingView()
            } else {
                HomeView()
            }
        } // ZStack
    }
}

#Preview {
    ContentView()
}
