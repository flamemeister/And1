//
//  SignInView.swift
//  AndOne
//
//  Created by Aldiyar Saken on 01.12.2023.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State var txtMobile: String = ""
    @State var isShowPicker: Bool = false
    @State var countryObj: Country?
     
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                Image("KickPosters")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250, height: 400)
                Spacer()
            }
            ScrollView{
                VStack(alignment: .leading){
                    Text("Good shoes take you\nGood places")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        //.multilineTextAlignment(.center)
                        .padding(.bottom, 25)
                    
                    HStack{
                        Button{
                            isShowPicker = true
                        } label: {
                             Image("")
                            
                            Text( "+49")
                                .font(.customfont(.medium, fontSize: 18))
                                .foregroundColor(.primaryText)
                        }
                        TextField("Enter Mobile", text: $txtMobile)
                            .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    Divider()
                        .padding(.bottom, 25)
                    
                    Text("Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 14))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.center)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                        .padding(.bottom, 25)
                    
                    
                    
                    Button{
                        
                    } label: {
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Continue with Google")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    .padding(.bottom, 8)

                    
                    
                    
                    Button{
                        
                    } label: {
                        Image("facebook")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        Text("Continue with Facebook")
                            .font(.customfont(.bold, fontSize: 18))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
                    .background(Color(hex: "5383EC"))
                    .cornerRadius(20)
                    
                }
                .padding(.horizontal, 20)
                .frame(width: .screenWidth, alignment: .leading)
                .padding(.top, .topInsets + .screenWidth * 0.7 )
            }
        }
        .sheet(isPresented: $isShowPicker, content: { CountryPickerUI(country: $countryObj)})
            .navigationTitle("")
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .ignoresSafeArea()
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
