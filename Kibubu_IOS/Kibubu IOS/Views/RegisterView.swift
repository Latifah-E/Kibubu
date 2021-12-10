//
//  RegisterView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 25/11/2021.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewRouter: ViewRouter
    @State private var fname: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack{
//            HStack{
//                Button(action: {
//                    withAnimation(){
//                        viewRouter.currentPage = .page1
//                    }
//                }, label: {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(Color("walkthrough"))
//                }).padding(.leading, 20)
//                Spacer()
//                
//            }.padding(.top, 10)
            Spacer()
            Text("Login")
                .font(Font.custom("Poppins-semiBold", size: 30 ))
                .multilineTextAlignment(.leading)
                .foregroundColor(Color("walkthrough"))
                .padding(.bottom, 50)
            VStack(spacing: 15){
              
                HStack{
                    Image(systemName: "paperplane")
                        .foregroundColor(email.isEmpty ? Color("login") :  Color("teal"))
                        .font(Font.custom("Poppins-Light", size: 18 ))
                        .padding(.leading, 10)
                    TextField("", text: $email)
                        .padding(.leading, 0)
                        .placeholder(when: email.isEmpty) {
                            Text("Email Address").opacity(0.3)
                        }
                        .padding(15)
                        .font(Font.custom("Poppins-Light", size: 14 ))
                        .foregroundColor(.black)
                        .background(Color.white)
                        
                }.clipShape(Rectangle())
                    .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(email.isEmpty ? Color("walkthrough").opacity(0.8) : Color("teal"), lineWidth: 0.5)
                            )
                HStack{
                    Image(systemName: "key")
                        .foregroundColor(password.isEmpty ? Color("login") :  Color("teal"))
                        .font(Font.custom("Poppins-Light", size: 18 ))
                        .padding(.leading, 15)
                    SecureField("", text: $password)
                        .padding(.leading, 0)
                        .placeholder(when: password.isEmpty) {
                            Text("Password").opacity(0.3)
                        }
                        .padding(15)
                        .font(Font.custom("Poppins-Light", size: 14 ))
                        .foregroundColor(.black)
                        .background(Color.white)
                        
                }.clipShape(Rectangle())
                    .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(password.isEmpty ? Color("walkthrough").opacity(0.8) : Color("teal"), lineWidth: 0.5)
                            )
                
                Button(action: {
                    withAnimation(){
//                        viewRouter.currentPage = .page1
                    }
                }, label: {
                    HStack{
                        Spacer()
                        Text("Forgot Your password?")
                            .font(Font.custom("Poppins-Light", size: 12 ))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("teal"))
                    }
                    
                }).padding(.bottom, 40)
                    Button(action: {
                        withAnimation(){
                            viewRouter.currentPage = .page5
                        }
                    }, label: {
                        HStack{
                            Spacer()
                        Text("Login")
                            .font(Font.custom("Poppins-Light", size: 14 ))
                            .multilineTextAlignment(.leading)
                            .foregroundColor(.white)
                            Spacer()
                        }
                           
                    }) .padding(.vertical, 15)
                .background(Color("teal"))
                .cornerRadius(10)
                
                Button(action: {
                    withAnimation(){
                        viewRouter.currentPage = .page3
                    }
                }, label: {
                    Text("Sign Up")
                        .font(Font.custom("Poppins-Light", size: 14 ))
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("login"))
                })
            }.padding(.horizontal, 30)
            
            
            Spacer()
            VStack{
                HStack{
                    Image(systemName: "rectangle.fill")
                        .resizable()
                        .frame(width: .infinity, height: 0.8)
                        .foregroundColor(Color("walkthrough"))
                    Text("OR")
                        .font(Font.custom("Poppins-regular", size: 16 ))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("walkthrough"))
                    Image(systemName: "rectangle.fill")
                        .resizable()
                        .frame(width: .infinity, height: 0.8)
                        .foregroundColor(Color("walkthrough"))
                        
                }
                HStack{
                    Link(destination: URL(string: "https://web.facebook.com/?_rdc=1&_rdr")!) {
                        Image("fb")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }.padding(5)
                    Link(destination: URL(string: "https://www.google.com/")!) {
                        Image("google")
                            .resizable()
                            .frame(width: 50, height: 50)
                    }.padding(5)
                    Link(destination: URL(string: "https://twitter.com/?lang=en")!) {
                        Image("twitter")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }.padding(5)
                }.padding(.top, 20)
                
                
            }.padding(.bottom, 40)
        }.transition(.move(edge: .trailing))
            .background(Color.white)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(viewRouter: ViewRouter())
    }
}
