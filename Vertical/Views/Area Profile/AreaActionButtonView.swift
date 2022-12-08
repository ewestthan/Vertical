//
//  AreaActionButtonView.swift
//  Vertical
//
//  Created by Ethan West on 12/6/22.
//

import SwiftUI

struct AreaActionButtonView: View{
    
    @ObservedObject var viewModel: AreaViewModel
    var isFollowed: Bool { return viewModel.area.isFollowed ?? false }
    
    var body: some View{
        HStack{
            Button(action:{
                isFollowed ? viewModel.unfollow() : viewModel.follow()
            }, label: {
                if (isFollowed) {
                    Text("Following")
                        .frame(width: 120, height: 35)
                        .background(.white)
                        .foregroundColor(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                        .cornerRadius(20)
                        .fontWeight(.bold)
                        .overlay(
                            Capsule(style: .continuous)
                                .stroke(Color(hue: 0.72, saturation: 0.715, brightness: 0.956), lineWidth: 2)
                        )
                }
                else {
                    Text("Follow")
                        .frame(width: 120, height: 35)
                        .background(Color(hue: 0.72, saturation: 0.715, brightness: 0.956))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .fontWeight(.bold)
                }
            })
        }.padding([.trailing, .leading], 10)
    }
}
