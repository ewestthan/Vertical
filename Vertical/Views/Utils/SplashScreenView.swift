//
//  SplashScreenView.swift
//  Vertical
//
//  Created by Ethan West on 12/9/22.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        
        if isActive{
            ContentView()
        }
        else{
            VStack{
                VStack{
                    Image("appstore")
                        .resizable()
                        .scaledToFit()
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.2)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
            }.background(Color(hue: 0.72, saturation: 0.715, brightness: 0.984))
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
                        withAnimation{
                            self.isActive = true
                        }
                    }
                }
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
