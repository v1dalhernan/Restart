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
            Text("Home")
                .font(.largeTitle)
            
            Button {
                isOnboarding = true
            } label: {
                Text("Restart")
            }
        }
            
    }
}

#Preview {
    HomeView()
}
