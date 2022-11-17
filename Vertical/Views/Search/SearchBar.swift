//
//  SearchBar.swift
//  Vertical
//
//  Created by Ethan West on 10/31/22.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Binding var tabSelected: SearchTab
     
    @State private var isEditing = false
    
    @EnvironmentObject var climbSearchViewModel: ClimbSearchViewModel
    @EnvironmentObject var userSearchViewModel: UserSearchViewModel
 
    var body: some View {
            HStack {
                
                TextField("Search ...", text: $text)
                    .onSubmit {
                        if ($tabSelected.wrappedValue == .climbs) {
                            climbSearchViewModel.search(climbName: text)
                        }
                        if ($tabSelected.wrappedValue == .users) {
                            userSearchViewModel.search(userName: text)
                        }
                    }
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .textInputAutocapitalization(.none)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                    
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        
                        // Dismiss the keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                }
            }
        }
}

