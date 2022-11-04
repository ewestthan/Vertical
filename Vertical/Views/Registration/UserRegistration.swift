//
//  UserRegistration.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI

struct UserRegistrationView1: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""



    var body: some View {
        VStack{
            Form{
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
                TextField("Email", text: $email)
                TextField("Username", text: $username)
                TextField("Password", text: $password)
                TextField("Confirm password", text: $confirmPassword)
            }
            NavigationLink{
                UserRegistrationView2()
            } label: {
                Text("Next").font(.system(size: 20))
            }
            Spacer()
        }
    }
}

struct UserRegistrationView2: View {
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""



    var body: some View {
        Form{
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
            TextField("Email", text: $email)
            TextField("Username", text: $username)
            TextField("Password", text: $password)
            TextField("Confirm password", text: $confirmPassword)
        }
    }
}


struct UserRegistration_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationView1()
    }
}
