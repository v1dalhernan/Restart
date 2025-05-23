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
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    
    
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color(.colorBlue)
                .ignoresSafeArea(.all, edges: .all)
                
            VStack (spacing: 20) {
                // MARK: - HEADER
                Spacer()
                
                VStack (spacing: 0){
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(Color(.white))
                        .transition(.opacity)
                        .id(textTitle)
                    
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
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture (
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                    }
                                    withAnimation(.easeOut(duration: 0.25)) {
                                        indicatorOpacity = 0
                                        textTitle = "Give."
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero
                                    withAnimation(.easeOut(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                }
                            
                            
                        ) // End of gesture
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    
                } // ZStack
                .overlay (
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundStyle(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(
                            .easeOut(duration: 1).delay(2), value: isAnimating
                        ),
                    alignment: .bottom
                )
                
            
                
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
                                withAnimation(Animation.easeOut(duration: 0.4)) {
                                    if buttonOffset > bottonWidth / 2 {
                                        hapticFeedback.notificationOccurred(.success)
                                        playSound(sound: "chimeup", type: "mp3")
                                        buttonOffset = bottonWidth - 80
                                        isOnboarding = false
                                    
                                    }else {
                                        hapticFeedback.notificationOccurred(.error)
                                        buttonOffset = 0
                                        
                                    }
                                }
                            }
                    )
                    
                    
                    
                } // ZStack
                .frame(width: bottonWidth,height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
            }// VStack
            
            
        } // ZStack
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark) // Force dark mode
        
        
            
    }
}

#Preview {
    OnboardingView()
}
