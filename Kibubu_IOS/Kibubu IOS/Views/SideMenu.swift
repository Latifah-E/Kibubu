//
//  SideMenu.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 01/12/2021.
//

import SwiftUI

struct SideMenu: View {
    @Binding var showMenu: Bool
    var body: some View {
        
        VStack(alignment: .leading) {
            
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                                   self.showMenu = false
                                }
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(Color.black)
                        .font(Font.custom("Poppins-Light", size: 15))
                })
                
            }
                    HStack {
                        Image(systemName: "person")
                            .foregroundColor(Color("teal"))
                            .font(Font.custom("Poppins-Light", size: 20))
                        Text("Profile")
                            .foregroundColor(.black)
                            .font(Font.custom("Poppins-Light", size: 14))
                    }
                    .padding(.top, 30)
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(Color("teal"))
                            .font(Font.custom("Poppins-Light", size: 20))
                        Text("Messages")
                            .foregroundColor(.black)
                            .font(Font.custom("Poppins-Light", size: 14))
                    }
                        .padding(.top, 30)
                    HStack {
                        Image(systemName: "gear")
                            .foregroundColor(Color("teal"))
                            .font(Font.custom("Poppins-Light", size: 20))
                        Text("Settings")
                            .foregroundColor(.black)
                            .font(Font.custom("Poppins-Light", size: 14))
                    }
                    .padding(.top, 30)
                    Spacer()
                }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 3)
        
    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(showMenu: Binding.constant(true))
    }
}
