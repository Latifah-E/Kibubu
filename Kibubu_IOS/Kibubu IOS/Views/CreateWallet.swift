//
//  CreateWallet.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 25/11/2021.
//

import SwiftUI

struct CreateWallet: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var selected: SelectedIcon
    @State var icon: String = "wallet1"
    @State private var email: String = ""
    @State private var showPopUp: Bool = false
    @State var value = ""
    var holder = "Currency"
    var dropDownList = ["USD", "TSH", "EURO", "KSH"]
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    
                    Spacer()
                    Text("Create your first wallet")
                        .font(Font.custom("Poppins-semiBold", size: 18 ))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color.black)
                    Spacer()
                   
                }.padding(.top, 10)
                 .padding(.bottom, 30)
                
                
                Text("Kibubu helps you to keep track of spending money from wallets. Each wallet represents a source of money such as cash or bank Account")
                    .font(Font.custom("Poppins-light", size:14 ))
                    .foregroundColor(Color("walkthrough"))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                
                VStack(spacing: 15){
                    if self.selected.currentObject == .object1{
                        Image(wallet[0].self.image)
                            .resizable()
                            .frame(width: 72, height: 72)
                    }
                    else if self.selected.currentObject == .object2{
                        Image(wallet[1].self.image)
                            .resizable()
                            .frame(width: 72, height: 72)
                    }
                    else if self.selected.currentObject == .object3{
                        Image(wallet[2].self.image)
                            .resizable()
                            .frame(width: 72, height: 72)
                    }
                    else if self.selected.currentObject == .object4{
                        Image(wallet[3].self.image)
                            .resizable()
                            .frame(width: 72, height: 72)
                    }
                    else{
                        Image(icon)
                            .resizable()
                            .frame(width: 72, height: 72)
                    }
                        
                    Button(action: {
                        withAnimation(.linear(duration: 0.3)) {
                            showPopUp.toggle()
                        }
                    }, label: {
                        Text("Change Icon")
                            .font(Font.custom("Poppins-regular", size:14 ))
                            .foregroundColor(Color("login"))
                            .multilineTextAlignment(.center)
                    })
                        .padding(.bottom, 50)
                    TextField("", text: $email)
                        .padding(.leading, 0)
                        .placeholder(when: email.isEmpty) {
                            Text("Wallet Name").opacity(0.3)
                        }
                        .padding(15)
                        .font(Font.custom("Poppins-Light", size: 14 ))
                        .foregroundColor(.black)
                        .background(Color.white)
                        .clipShape(Rectangle())
                            .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(email.isEmpty ? Color("walkthrough").opacity(0.8) : Color("teal"), lineWidth: 0.5)
                                    )
                    Menu {
                                ForEach(dropDownList, id: \.self){ client in
                                    Button(client) {
                                        self.value = client
                                    }
                                }
                    } label: {
                               VStack(spacing: 5){
                                   HStack{
                                       Text(value.isEmpty ? holder : value)
                                           .foregroundColor(value.isEmpty ? Color("walkthrough").opacity(0.8) : .black)
                                           .font(Font.custom("Poppins-Light", size: 14 ))
                                       Spacer()
                                       Image(systemName: "chevron.down")
                                           .foregroundColor(Color.black)
                                           .font(Font.system(size: 14))
                                   }
                                   .padding(15)
                                   .overlay(
                                               RoundedRectangle(cornerRadius: 10)
                                                   .stroke(value.isEmpty ? Color("walkthrough").opacity(0.8) : Color("teal"), lineWidth: 0.5)
                                           )
                                   
                               }
                           }
                    
                    Spacer()
                    Button(action: {
                        withAnimation(){
                            viewRouter.currentPage = .page6
                        }
                    }, label: {
                        HStack{
                            Spacer()
                        Text("Continue")
                            .font(Font.custom("Poppins-Light", size: 14 ))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.black)
                            Spacer()
                        }
                           
                    }) .padding(.vertical, 15)
                       
                .background(Color("teal"))
                .cornerRadius(10)
                }.padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                
                
            } .padding(.bottom, 30)
            ZStack {
                       if  showPopUp == true {
                           // PopUp background color
                           Color.black.opacity(showPopUp  ? 0.4 : 0).edgesIgnoringSafeArea(.all)

                           // PopUp Window
                           VStack(alignment: .center, spacing: 0) {
                               Text("Please Select An Icon")
                                   .font(Font.custom("Poppins-regular", size:14 ))
                                   .foregroundColor(Color("login"))
                                   .multilineTextAlignment(.center)
                                   .padding(.top, 30)
                                   .padding(.bottom, 10)
                               ScrollView(.horizontal, showsIndicators: false){
                               HStack{
                                   ForEach(wallet.indices , id: \.self){ index in
                                       Button(action: {
                                           selected.currentObject = wallet[index].chosen
                                           showPopUp = false
                                       }, label: {
                                           Image(wallet[index].image)
                                               .resizable()
                                               .frame(width: 72, height: 72)
                                       })
                                   }
                               }
                               }.padding()

                               Button(action: {
                                   // Dismiss the PopUp
                                   withAnimation(.linear(duration: 0.3)) {
                                       showPopUp = false
                                   }
                               }, label: {
                                   Text("Close")
                                       .foregroundColor(Color.white)
                                       .padding(.vertical, 10)
                                       .padding(.horizontal, 45)
                                       .background(Color("teal"))
                                       .cornerRadius(20)
                                       .font(Font.custom("Poppins-Light", size: 14 ))
                                       .padding(EdgeInsets(top: 10, leading: 25, bottom: 20, trailing: 25))
                               }).buttonStyle(PlainButtonStyle())
                           }
                           .frame(maxWidth: 350)
                           .background(Color.white.opacity(1))
                           .cornerRadius(30)
                           
                       }
                   }
            
        }
   
        
    }
//    func switchObjects(){
//        switch selected.currentObject  {
//        case .object1:
//            self.icon = wallet[0].self.image
//        case .object2:
//            self.icon = wallet[1].self.image
//        case .object3:
//            self.icon = wallet[2].self.image
//        case .object4:
//            self.icon = wallet[3].self.image
//        }
//    }
}

struct WalletPopup: View {
    @Binding var show: Bool
    @StateObject var selected: SelectedIcon
    var body: some View {
        ZStack {
                   if show {
                       // PopUp background color
                       Color.black.opacity(show ? 0.4 : 0).edgesIgnoringSafeArea(.all)

                       // PopUp Window
                       VStack(alignment: .center, spacing: 0) {
                           Text("Please Select An Icon")
                               .font(Font.custom("Poppins-regular", size:14 ))
                               .foregroundColor(Color("login"))
                               .multilineTextAlignment(.center)
                               .padding(.top, 30)
                               .padding(.bottom, 10)
                           ScrollView(.horizontal, showsIndicators: false){
                           HStack{
                               ForEach(wallet.indices , id: \.self){ index in
                                   Button(action: {
                                       selected.currentObject = wallet[index].chosen
                                       show = false
                                   }, label: {
                                       Image(wallet[index].image)
                                           .resizable()
                                           .frame(width: 72, height: 72)
                                   })
                               }
                           }
                           }.padding()

                           Button(action: {
                               // Dismiss the PopUp
                               withAnimation(.linear(duration: 0.3)) {
                                   show = false
                               }
                           }, label: {
                               Text("Close")
                                   .foregroundColor(Color.white)
                                   .padding(.vertical, 10)
                                   .padding(.horizontal, 45)
                                   .background(Color("teal"))
                                   .cornerRadius(20)
                                   .font(Font.custom("Poppins-Light", size: 14 ))
                                   .padding(EdgeInsets(top: 10, leading: 25, bottom: 20, trailing: 25))
                           }).buttonStyle(PlainButtonStyle())
                       }
                       .frame(maxWidth: 350)
                       .background(Color.white.opacity(1))
                       .cornerRadius(30)
                       
                   }
               }
    }
}

struct CreateWallet_Previews: PreviewProvider {
    static var previews: some View {
        CreateWallet(viewRouter: ViewRouter(), selected: SelectedIcon())
    }
}
