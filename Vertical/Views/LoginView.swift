//
//  LoginView.swift
//  Vertical
//
//  Created by user227908 on 10/28/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var user: User
    
    @StateObject private var loginVM = LoginViewModel()
    
    var body: some View {
        VStack {
            Text("Vertical")
                .font(.largeTitle)
            Text("Sign in")
                .font(.title3)
            
            TextField("Email Address", text: $loginVM.email)
                .keyboardType(.emailAddress)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.none)
            SecureField("Password", text: $loginVM.password)
                .onSubmit {
                    Task {
                        await loginVM.login()
                    }
                    
                }
                .onAppear() {
                    loginVM.localUser = user
                }
            
            if loginVM.loading {
                ProgressView()
            }
            
            Button("Sign in") {
                Task {
                    await loginVM.login()
                }
            }
            .padding(.bottom,20)
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .disabled(loginVM.loading)
    }
}
