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
struct LoginViewO: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var valid = false
    @State private var showingInvalidAlert = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(hex: "#d4d4d8"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(hex: "#d4d4d8"))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Button("Wow") {
                    Text("Login")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .frame(width: 220, height: 60)
                .background(.green)
                .cornerRadius(5.0)
                
                NavigationLink(destination: Text("Success!"), isActive: $valid) { //<- This will take it to rest
                    TaskBar()
                    
                }
                
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

