//
//  CreateTransaction.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 26/11/2021.
//

import SwiftUI

struct CreateTransaction: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            Text("A habit to build")
                .font(Font.custom("Poppins-semiBold", size: 18 ))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color.black)
                .padding(.bottom, 30)
                .padding(.top, 30)
            
            Image("amico")
                .resizable()
                .frame(width: 142, height: 145)
                .padding(.bottom, 30)
            
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam us,")
                .font(Font.custom("Poppins-light", size:14 ))
                .foregroundColor(Color("walkthrough"))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 25)
                .padding(.bottom, 15)
            Spacer()
            
            Button(action: {
                withAnimation(){
                    viewRouter.currentPage = .page7
                }
            }, label: {
                HStack{
                    Spacer()
                Text("Add First Transaction")
                    .font(Font.custom("Poppins-Light", size: 14 ))
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    Spacer()
                }
                   
            }) .padding(.vertical, 15)
                .background(Color("teal"))
                .cornerRadius(10)
            Spacer()
            
        }.padding(.horizontal, 30)
            .transition(.move(edge: .trailing))
    }
}

struct CreateTransaction_Previews: PreviewProvider {
    static var previews: some View {
        CreateTransaction(viewRouter: ViewRouter())
    }
}
