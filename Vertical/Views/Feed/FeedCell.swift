//
//  FeedCell.swift
//  Vertical
//
//  Created by Arthur Dolimier on 12/3/22.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI

struct FeedCell: View {
    @ObservedObject var viewModel: FeedCellViewModel
    
    var didLike: Bool { return viewModel.post.didLike ?? false}
    
    init(viewModel: FeedCellViewModel) {
        self.viewModel = viewModel
        
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                WebImage(url: URL(string: viewModel.post.ownerImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipped()
                    .cornerRadius(100)

                Text(viewModel.post.ownerUsername)
            }.padding(.leading, 10)
            
            WebImage(url: URL(string: viewModel.post.imageUrl))
                .resizable()
                .scaledToFill()
                .frame(maxWidth: 395, maxHeight: 440)
                .clipped()
            
            HStack{
                VStack(alignment: .leading){
                    HStack{
                        VStack(alignment: .leading){
                            Text("V\(viewModel.post.grade) \(viewModel.post.climbName)")
                                .font(.system(size: 20))
                            Text(viewModel.post.climbLocation)
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        
                        StarsView(rating: 5).frame(height: 18)
                        
                    }
                    ZStack(alignment: .topLeading){
                        Rectangle().foregroundColor(.gray).opacity(0.5)
                            .cornerRadius(10)
                            .frame(maxHeight: 1000)
                        HStack{
                            //Text("jwebxl").font(.system(size: 14, weight: .semibold)) +
                            Text(viewModel.post.description).font(.system(size: 15))
                                
                        }
                        .padding(20)
                    }
                    Text(viewModel.post.getFormattedDate())
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                        .padding(.top, 8)

                }.padding(.trailing, 15)
                VStack(spacing: 8){
                    Button(action: {
                        didLike ? viewModel.unlike() : viewModel.like()
                     
                    }, label: {
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .font(.system(size: 20))
                            .scaledToFill()
                            .padding(4)
                    })
//                                Button {
//
//                                } label: {
//                                    Image(systemName: "bubble.right")
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                        .font(.system(size: 20))
//                                        .scaledToFill()
//                                    .padding(4)                }
//                                Button {
//
//                                } label: {
//                                    Image(systemName: "paperplane")
//                                        .resizable()
//                                        .frame(width: 20, height: 20)
//                                        .font(.system(size: 20))
//                                        .scaledToFill()
//                                        .padding(4)
//                                }
                    
                }.foregroundColor(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                    .frame(alignment: .topLeading)
                    .padding(.trailing, 8)
            }
            .padding([.leading, .bottom], 10)
        }
        .padding(.bottom, 10)
    }
}
