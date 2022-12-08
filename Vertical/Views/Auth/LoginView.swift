//
//  LoginView.swift
//  Vertical
//
//  Created by user227908 on 10/28/22.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View{
        NavigationView{
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack(spacing: 20){
                    
                    CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    CustomSecureField(text: $password, placeholder: Text("Password"))
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .padding(.horizontal, 32)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    
                    HStack{
                        Spacer()
                        Button (action: {
                            
                        }, label: {
                            Text("Forgot Password?")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.top)
                                .padding(.trailing, 28)
                        })

                    }
                    Button (action:{ Task {
                        await viewModel.login(withEmail: email, password: password)
                    }}, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width: 360, height: 50)
                            .background(.purple)
                            .clipShape(Capsule())
                            .padding()
                    })
                    Spacer()
                        
                    NavigationLink (
                        destination:
                            RegistrationView().navigationBarHidden(true),
                        label:{
                            HStack{
                                Text("Don't have an account?")
                                    .font(.system(size: 14))
                                Text("Sign Up")
                                    .font(.system(size: 14, weight: .semibold))
                            }.foregroundColor(.purple)
                    }).padding(.bottom, 30)
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View{
        LoginView()
    }
}




//
//    @EnvironmentObject var user: User
//
//    @StateObject private var loginVM = LoginViewModel()
//
//    var body: some View {
//        VStack {
//            Text("Vertical")
//                .font(.largeTitle)
//            Text("Sign in")
//                .font(.title3)
//
//            TextField("Email Address", text: $loginVM.email)
//                .keyboardType(.emailAddress)
//                .autocorrectionDisabled(true)
//                .textInputAutocapitalization(.none)
//            SecureField("Password", text: $loginVM.password)
//                .onSubmit {
//                    Task {
//                        await loginVM.login()
//                    }
//
//                }
//                .onAppear() {
//                    loginVM.localUser = user
//                }
//
//            if loginVM.loading {
//                ProgressView()
//            }
//
//            Button("Sign in") {
//                Task {
//                    await loginVM.login()
//                }
//            }
//            .padding(.bottom,20)
//        }
//        .autocapitalization(.none)
//        .textFieldStyle(RoundedBorderTextFieldStyle())
//        .padding()
//        .disabled(loginVM.loading)
//    }
