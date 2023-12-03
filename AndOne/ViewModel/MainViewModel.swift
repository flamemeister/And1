//
//  MainViewModel.swift
//  AndOne
//
//  Created by Aldiyar Saken on 03.12.2023.
//

import SwiftUI

class MainViewModel: ObservableObject{
    static var shared: MainViewModel = MainViewModel()
    
    @Published var txtEmail: String = ""
    @Published var txtPassword: String = ""
    @Published var isShowPassword: Bool = false
    
    @Published var showError = false
    @Published var errorMessage = ""
    
    //service call
    func serviceCallLogin(){

        
        if(txtEmail.isValidEmail){
            self.errorMessage = "please enter your valid email"
            self.showError = true
            return
        }
        
        if(txtPassword.isEmpty){
            self.errorMessage = "please enter valid password"
            self.showError = true
            return
        }
        
        
        ServiceCall.post(parameter: ["email": txtEmail, "password": txtPassword] , path: Globs.SV_LOGIN){ responseObj in
            if let response = responseObj as? NSDictionary{
                if response.value(forKey: KKey.status) as? String ?? "" == "1"{
                    print(response);
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Success"
                    self.showError = true
                } else{
                    self.errorMessage = response.value(forKey: KKey.message) as? String ?? "Fail"
                    self.showError = true
                }
            }
        } failure: { error in
            self.errorMessage = error?.localizedDescription ?? "Fail"
            self.showError = true
        }
        }
    
}


