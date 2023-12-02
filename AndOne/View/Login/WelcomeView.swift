//
//  WelcomeView.swift
//  AndOne
//
//  Created by Aldiyar Saken on 01.12.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack{
            Image("welcome2")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack{
                Spacer()
                Image("logo3")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .padding(.bottom, 1)
            
                Text("Welcome \n to our shop")
                    .font(.customfont(.bold, fontSize: 43))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Text("we make your style fire")
                    .font(.customfont(.medium, fontSize: 16))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                NavigationLink{
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started"){
                        
                    }
                }
                Spacer()
                    .frame(height: 90)
            }
            .padding(.horizontal, 30)
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            WelcomeView()
        }
    }
}
