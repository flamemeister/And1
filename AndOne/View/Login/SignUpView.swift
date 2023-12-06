//
//  SignUpView.swift
//  AndOne
//
//  Created by Aldiyar Saken on 06.12.2023.
//

import SwiftUI
import FirebaseAuth

struct SignUpView: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    @StateObject var mainVM = MainViewModel.shared;
    
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .scaledToFill()
                .frame(width: .screenWidth, height: .screenHeight)
            
            ScrollView{
                VStack{
                    Image("logo3")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70)
                        .padding(.bottom, .screenWidth * 0.12)
                    
                    Text("Sign up")
                    
                        .font(.customfont(.bold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, 4)
                    
                    Text("Enter your email and password")
                        .font(.customfont(.semibold, fontSize: 16))
                        .foregroundColor(.primaryText.opacity(0.6))
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, .screenWidth * 0.1)
                    
                    LineTextField( title: "Username", placeholder: "Enter your username", txt: $mainVM.txtUsername,keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineTextField( title: "Email", placeholder: "Enter your email", txt: $mainVM.txtEmail,keyboardType: .emailAddress)
                        .padding(.bottom, .screenWidth * 0.07)
                    
                    LineSecureField( title: "Password", placeholder: "Enter your password", txt: $mainVM.txtPassword, isShowPassword: $mainVM.isShowPassword)
                        .padding(.bottom, .screenWidth * 0.02)
                    
                    Button{
                        
                    } label: {
                        
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    RoundButton(title: "Create account"){
                        register(email: mainVM.txtEmail, password: mainVM.txtPassword)
                    }
                    .padding(.bottom, .screenWidth * 0.05)
                    
                    NavigationLink{
                        SignUpView()
                    } label: {
                        HStack{
                            Text("Already have account?")
                                
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.primaryText)
                            Text("Log in")
                                .font(.customfont(.medium, fontSize: 14))
                                .foregroundColor(.blue)
                        }
                    }
                    
                
                    Spacer()
                    
                }
                .padding(.top, .topInsets + 64)
                .padding(.horizontal, 20)
                .padding(.bottom, .bottomInsets)
                
            }
            VStack{
                
                HStack{
                    Button{
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                    }
                    Spacer()
                }
                Spacer()
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
    }
}

func register(email: String, password: String){
    Auth.auth().createUser(withEmail: email, password: password){ result, error in
        if error != nil{
            print(error!.localizedDescription)
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
