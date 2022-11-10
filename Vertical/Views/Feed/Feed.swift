//
//  Feed.swift
//  Vertical
//
//  Created by Ethan West on 10/19/22.
//

import Foundation
import SwiftUI

struct Feed: View {
    
    @EnvironmentObject var user: User
    @StateObject private var feedVM = FeedViewModel()
    
    var body: some View {
        ScrollView{
            LazyVStack(spacing: 15) {
                ForEach(feedVM.posts) { post in
                    VStack(alignment: .leading){
                        HStack{
                            Image("jimmy")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipped()
                                .cornerRadius(100)
                                
                                .shadow(radius: 7)
                            Text(user.name)
                        }.padding(.leading, 10)
                        
                        
                        Image("jimmy")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: 395, maxHeight: 440)
                            .clipped()
                        
                        HStack{
                            VStack(alignment: .leading){
                                HStack{
                                    VStack(alignment: .leading){
                                        Text("V8 Climb")
                                            .font(.system(size: 20))
                                        Text("Tahoe")
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    StarsView(rating: 5).frame(height: 18)
                                }
                                ZStack(alignment: .topLeading){
                                    Rectangle().foregroundColor(.gray).opacity(0.5)
                                        .cornerRadius(10)
                                        .frame(maxHeight: 100)
                                    HStack{
                                        //Text("jwebxl").font(.system(size: 14, weight: .semibold)) +
                                        Text(post.content).font(.system(size: 15))
                                    }
                                    .padding(10)
                                }
                                Text(post.getFormattedDate())
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                                    .padding(.top, 8)
                            }.padding(.trailing, 15)
                            VStack(spacing: 8){
                                Button {
                                    
                                } label: {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .font(.system(size: 20))
                                        .scaledToFill()
                                        .padding(4)
                                }
                                Button {
                                    
                                } label: {
                                    Image(systemName: "bubble.right")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .font(.system(size: 20))
                                        .scaledToFill()
                                    .padding(4)                }
                                Button {
                                    
                                } label: {
                                    Image(systemName: "paperplane")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .font(.system(size: 20))
                                        .scaledToFill()
                                        .padding(4)
                                }
                                
                            }.foregroundColor(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                                .frame(alignment: .topLeading)
                                .padding(.trailing, 8)
                        }
                        .padding([.leading, .bottom], 10)
                    }
                    .padding(.bottom, 10)
                    
//                    Text(post.title).font(.title3)
//                    Text(post.content).font(.caption)
//                    FeedVideoCell()
                    
                }
            }.padding(.top)
            
            if feedVM.fetching {
                ProgressView()
            }
        }.onAppear{ Task { await feedVM.loadPostsFollowing(userUID: user.uid)} }
        
    }
}

struct Feed_Previews: PreviewProvider {
    static var previews: some View {
        Feed()
    }
}
