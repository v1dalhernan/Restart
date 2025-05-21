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
    
    @State private var bottonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(.colorBlue)
                .ignoresSafeArea(.all, edges: .all)
                
            VStack (spacing: 20) {
                // MARK: - HEADER
                Spacer()
                
                VStack (spacing: 0){
                   Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color(.white))
                    
                    Text(
                        """
                        It's not how much we give but
                        how much love we put into giving.
                        """
                    )
                        .font(.title3)
                        .fontWeight(.light)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(Color(.white))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                } // VStack
                
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(
                        shapeColor: .white,
                        shapeOpacity: 0.2
                    )
                        
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        
                    
                } // ZStack
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // parts of the custom button
                    
                    // 1. BACKGROUND
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                        
                    
                    // 2. call to action
                    
                    Text("Get Started")
                        .font(.system(
                            .title3, design: .rounded, weight: .bold
                        ))
                        .foregroundStyle(.white)
                        .offset(x:20)
                    
                    // 3. capsule
                    
                    HStack {
                        Capsule()
                            .fill(.colorRed)
                            .frame(width: buttonOffset + 80, height: 80)
                        Spacer()
                    }
                    
                    // 4. circle
                    HStack {
                        ZStack {
                            Circle()
                                .fill(.colorRed)
                            Circle()
                            .fill(.black.opacity(0.15))
                            .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                            
                                
                        } // ZStack
                        .frame(width: 80, height: 80, alignment: .center)
                        .foregroundStyle(.white)
                        .offset(x: buttonOffset)
                        
                        Spacer()
                        
                    } // HStack
                    .gesture (
                        DragGesture()
                            .onChanged { gesture in
                                if gesture.translation.width > 0  && gesture.translation.width < bottonWidth - 80 {
                                    buttonOffset = gesture.translation.width
                                }
                            }
                            .onEnded { gesture in
                                if buttonOffset > bottonWidth / 2 {
                                    buttonOffset = bottonWidth - 80
                                    isOnboarding = false
                                
                                }else {
                                    buttonOffset = 0
                                }
                            }
                    )
                    
                    
                    
                } // ZStack
                .frame(width: bottonWidth,height: 80, alignment: .center)
                .padding(.horizontal, 30)
                
            }// VStack
            
            
        } // ZStack
        
        
            
    }
}

#Preview {
    OnboardingView()
}
