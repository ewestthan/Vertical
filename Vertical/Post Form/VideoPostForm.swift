//
//  VideoPostForm.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI

struct VideoPostForm: View {
    @State private var description: String = ""
//    @FocusState private var emailFieldIsFocused: Bool = false
    
    @State private var grade: Int = 0
    @State private var sliderValue: Double = 0
    @State private var selectedDate = Date()
    var body: some View {
        
            VStack{
                
                Rectangle().frame(maxWidth: 395, maxHeight: 440)
                
                TextField("Comment", text: $description, axis: .vertical)
                    .lineLimit(4, reservesSpace: true)
                    .padding(7)
                    .background(.gray)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .border(.secondary)
                    .cornerRadius(10)
                HStack{
                    Text("V")
                    VStack{
                        Button {
                            if(grade < 17){ grade += 1 }
                        } label: {
                            Text("+")
                        }
                        Text(String(grade))
                        Button {
                            if(grade > 0){ grade -= 1 }
                        } label: {
                            Text("-")
                        }
                    }
                    VStack{
                        StarsView(rating: Int(sliderValue)).frame(maxHeight: 20)
                        Slider(value: $sliderValue, in: 0...5, step: 1)
                            .frame(maxWidth: 140)
                            .accentColor(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                    }
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .frame(maxWidth: 120)
                }
        }
    }
}

struct VideoPostForm_Previews: PreviewProvider {
    static var previews: some View {
        VideoPostForm()
    }
}
