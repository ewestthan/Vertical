//
//  EditUserProfile.swift
//  Vertical
//
//  Created by Ethan West on 11/17/22.
//

import SwiftUI

struct EditUserProfile: View {
    
    @State private var description = ""
    
    var body: some View {
        VStack(){
            HStack{
                Button {
                    
                } label: {
                    Text("Cancel")
                }

                Spacer()
                Button {
                    
                } label: {
                    Text("Done").bold()
                }

            }.padding()
            
            TextField("Tell us about yourself...", text: $description, axis: .vertical)
                .lineLimit(4, reservesSpace: true)
                .padding(7)
                .background(.gray).opacity(0.4)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .cornerRadius(10)
                .frame(width: 350, height: 200)
                .foregroundColor(.black)
            Spacer()
        }
    }
}

struct EditUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditUserProfile()
    }
}
