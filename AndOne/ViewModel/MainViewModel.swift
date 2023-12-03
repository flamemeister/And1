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
}


