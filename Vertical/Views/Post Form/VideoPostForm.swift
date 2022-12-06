//
//  VideoPostForm.swift
//  Vertical
//
//  Created by Ethan West on 11/1/22.
//

import SwiftUI

struct VideoPostForm: View {
    
    @State private var selectedImage: UIImage?
    @State var postImage: Image?
    @State var imagePickerPresented = false
    
    @State private var description: String = ""
//    @FocusState private var emailFieldIsFocused: Bool = false
    
    @State private var selectedDate = Date()
    @Binding var tabIndex: Int
    @ObservedObject var viewModel = UploadPostViewModel()
    @ObservedObject var climbViewModel = ClimbSearchViewModel()
    
    @State var grade: Int
    @State var sliderValue: Double
    @State var name: String
    @State var area: String
    
    var body: some View {
            VStack{
                if(postImage == nil){
                    Button(action: {
                        imagePickerPresented.toggle()
                    },
                           label:{
                        ZStack{
                            Rectangle().frame(maxWidth: .infinity, maxHeight: 440).foregroundColor(.black)
                            Image(systemName: "square.and.arrow.up").foregroundColor(.white)
                        }
                        
                    }).sheet(isPresented: $imagePickerPresented, onDismiss: loadImage,
                        content: {
                        ImagePicker(image: $selectedImage)
                    })
                }
                else if let image = postImage{
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 440).foregroundColor(.black)
                }
                
                TextField("Comment", text: $description, axis: .vertical)
                    .lineLimit(4, reservesSpace: true)
                    .padding(7)
                    .background(.gray).opacity(0.4)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .cornerRadius(10)
                    .padding([.leading, .trailing], 10)
                    .padding([.top, .bottom], 10)
                HStack(alignment: .center, spacing: 30){
                    
                    HStack{
                        Text("V").padding(.bottom, 5)
                        VStack{
                            Button {
                                if(grade < 17){ grade += 1 }
                            } label: {
                                Image("arrow")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 12, maxHeight: 12 )
                                    .rotationEffect(Angle(degrees: 90))
                            }
                            Text(String(grade))
                                .frame(width: 20)
                                .background(Color(.gray).opacity(0.2))
                                .cornerRadius(5)
                            
                            Button {
                                if(grade > 0){ grade -= 1 }
                            } label: {
                                Image("arrow").resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: 12, maxHeight: 12 )
                                    .rotationEffect(Angle(degrees: 270))
                            }
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
                Button(action: {
                    Task{
                        if let image = selectedImage {
                            await viewModel.uploadPost(description: description, grade: grade, rating: Int(sliderValue), date: selectedDate, image: image, name: name, area: area)
                            { _ in
                                description = ""
                                postImage = nil
                                tabIndex = 0
                            }
                        }
                    }
                }, label:{ Text("Share")
                        .frame(maxWidth: 120, maxHeight: 35)
                        .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .fontWeight(.bold)
                        .padding(.top, 10)
                })
        }
    }
}

extension VideoPostForm{
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        
        postImage = Image(uiImage: selectedImage)
    }
}

struct VideoPostForm_Previews: PreviewProvider {
    static var previews: some View {
        VideoPostForm(tabIndex: .constant(3), grade: 0, sliderValue: 0.0, name: "", area: "")
    }
}
