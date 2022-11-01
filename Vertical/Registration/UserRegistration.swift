//
//  UserRegistration.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI

struct UserRegistration: View {
    
    @State private var firstName = ""
    @State private var lastName = ""

    var body: some View {
        Form{
            TextField("First Name", text: $firstName)
            TextField("Last Name", text: $lastName)
        }
    }
}

struct UserRegistration_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistration()
    }
}
