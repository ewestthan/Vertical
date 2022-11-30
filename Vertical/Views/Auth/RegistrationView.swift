//
//  RegistrationView.swift
//  Vertical
//
//  Created by Ethan West on 11/10/22.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var username = ""
    @State private var password = ""
    @State private var selectedImage: UIImage?
    @State private var image: Image?
    @State var imagePickerPresented = false
    
    @Environment(\.presentationMode) var mode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.white]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack(spacing: 20){
                
                if let image = image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(Circle())
                        .padding(.top, 22)
                }
                else{
                    Button(action: {
                        imagePickerPresented.toggle()
                    },
                           label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 140, height: 140)
                            .foregroundColor(.white)
                    })
                    .sheet(isPresented: $imagePickerPresented, onDismiss: loadImage, content: {ImagePicker(image: $selectedImage)})
                    .padding()
                }
                
                CustomTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                
                CustomTextField(text: $username, placeholder: Text("Username"), imageName: "person")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                
                CustomTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "envelope")
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                
                CustomSecureField(text: $password, placeholder: Text("Password"))
                    .padding()
                    .background(Color(.init(white: 1, alpha: 0.15)))
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 32)
                
                Button (action:{ Task{
                    await viewModel.register(withEmail: email, password: password, image: selectedImage, fullname: fullname, username: username)
                }}, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 50)
                        .background(.purple)
                        .clipShape(Capsule())
                        .padding()
                })
                Spacer()
                    
                Button(
                    action: {mode.wrappedValue.dismiss()},
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

extension RegistrationView {
    func loadImage(){
        guard let selectedImage = selectedImage else { return}
        image = Image(uiImage: selectedImage)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().environmentObject(AuthViewModel())
    }
}
