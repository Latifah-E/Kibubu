//
//  SplashScreen.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 22/11/2021.
//

import SwiftUI

struct SplashScreen: View {
    @State var isSplashScreen:Bool = false
    @State var fadeInOut:Bool = false
    @State private var scale: CGFloat = 0
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            if  self.isSplashScreen{
                GeometryReader{proxy in
                    let size = proxy.size
                    Walkthrough(viewRouter: viewRouter, screenSize: size)
                        .preferredColorScheme(.light)
                }
            }else{
            VStack{
                HStack{
                    Spacer()
                }
                Image("icon")
                    .resizable()
                    .frame(width: 84, height: 84)
                    .padding()
                    .padding(.top, 230)
                    .onAppear(){
                        withAnimation(Animation.easeIn(duration: 3)){
                            fadeInOut.toggle()
                            scale += 1
                        }
                       
                    }.opacity(fadeInOut ? 1 : 0)
                Image("Kibubu")
                    .resizable()
                    .frame(width: 135, height: 30)
                    .padding()
                Spacer()
            }.background(Color("SplashColor"))
                .transition(.move(edge: .top))
                
            }
        }.onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                           withAnimation {
                               self.isSplashScreen = true
                           }
                       }
                   }
    
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen(viewRouter: ViewRouter())
    }
}
