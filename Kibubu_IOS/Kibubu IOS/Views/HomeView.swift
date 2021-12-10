//
//  HomeView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 29/11/2021.
//

import SwiftUI
    
struct HomeView: View {
    @StateObject var viewRouter: ViewRouter
    @State var showMenu = false
    var body: some View {
        let drag = DragGesture()
                   .onEnded {
                       if $0.translation.width < -100 {
                           withAnimation {
                               self.showMenu = false
                           }
                       }
                   }
               
               return
                   GeometryReader { geometry in
                       ZStack(alignment: .leading) {
                           MainView(showMenu: self.$showMenu, viewRouter: viewRouter)
                           if self.showMenu {
                               ZStack{
                                   HStack{
                                       SideMenu(showMenu: self.$showMenu)
                                           .frame(width: geometry.size.width/1.5 )
                                           
                                       Spacer()
                                   }.transition(.move(edge: .leading))
                                  
                                   
                               }.frame(width: geometry.size.width/1, height: geometry.size.height/1)
                               .background(Color.black.opacity(0.5))
                                
                               
                           }
                       }
                           .gesture(drag)
                   }
               
       
          
       
       
    }
}
struct MainView: View {
    
    @Binding var showMenu: Bool
    @State var value = ""
    var holder = "All"
    var dropDownList = ["Yesterday", "One Week Ago", "One Month Ago", "Today", "All"]
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation{
                                   self.showMenu = true
                    }
                }, label: {
                Image(systemName: "line.horizontal.3")
                        .foregroundColor(.black)
                        .font(Font.custom("Poppins-Light", size: 25))
                    
                })
                Spacer()
                Text("Home")
                    .font(Font.custom("Poppins-semiBold", size: 16 ))
                    .padding(.leading, 10)
                Spacer()
                Button(action: {
                    
                }, label: {
                    Image("profile")
                        .resizable()
                        .frame(width: 40, height: 40)
                })
            }.padding(.horizontal, 25)
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    Text("Your Balance")
                        .font(Font.custom("Poppins-Light", size: 15 ))
                        .foregroundColor(Color("teal"))
                    Spacer()
                }
                
                HStack{
                    Text("15,000/= TZS")
                        .font(Font.custom("Poppins-Light", size: 13 ))
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack{
                    ZStack{
                        Image("moon")
                            .resizable()
                            .opacity(0.4)
                            .frame(width: 65, height: 80)
                            .padding(.top, -85)
                    }
                    ZStack{
                        HStack{
                            VStack{
                                HStack{
                                   
                                    Text("Wallet Name")
                                        .foregroundColor(Color.white)
                                        .font(Font.custom("Poppins-Light", size: 11 ))
                                        .multilineTextAlignment(.leading)
                                    Spacer()
                                }
                                HStack{
                                    Text("Total Cashflow")
                                        .foregroundColor(Color.white)
                                        .font(Font.custom("Poppins-semibold", size: 14 ))
                                    Spacer()
                                }
                                .padding(.bottom, 10)
                                HStack{
                                    Text("\(transactionee.map{$0.amount}.reduce(0, +))/=")
                                        .foregroundColor(Color.white)
                                        .font(Font.custom("Poppins-Semibold", size: 20 ))
                                    Spacer()
                                }

                            }
                            VStack{
                                Button(action: {
                                    
                                }, label: {
                                    Text("View Wallet")
                                        .font(Font.custom("Poppins-SemiBold", size: 11 ))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 25)
                                        .padding(.vertical, 8)
                                       
                                        .background(Color("teal"))
                                        .cornerRadius(5)
                                    
                                    
                                })
                            }.padding(.trailing, 15)
                        }
                       
                    }.padding(.leading, -45)
                        .padding(.bottom, 0)
                    
                }
                    .frame(width: .infinity, height: 170)
                    .background(Color("transactions"))
                    .cornerRadius(10)
                    .padding(.top, 20)
                
                
            }.padding(.horizontal, 25)
             .padding(.top, 25)
            
            VStack{
                HStack{
                    Text("All Transactions")
                        .font(Font.custom("Poppins-Regular", size: 15 ))
                          
                    Spacer()
                    
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
                                           .foregroundColor(.black)
                                           .font(Font.custom("Poppins-Light", size: 11 ))

                                       Image(systemName: "chevron.down")
                                           .foregroundColor(Color.black)
                                           .font(Font.custom("Poppins-Light", size: 10 ))
                                   }
                               }
                           }
                }.padding(.horizontal, 25)
                if self.value != "" {
                    if self.value == "All"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices, id: \.self){index in
                                    Transactioncategory(index: index)
                                }
                            }
                           
                        }
                    
                       
                    }else if self.value == "Yesterday"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 1} , id: \.self){index in
                                    Transactioncategory(index: index)
                                }
                            }
                    }
                    }else if self.value == "Today"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 0} , id: \.self){index in
                                    Transactioncategory(index: index)
                                }
                            }
                    }
                    }else if self.value == "One Week Ago"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 2 || transactionee[$0].date == 0 || transactionee[$0].date == 1} , id: \.self){index in
                                    Transactioncategory(index: index)
                                }
                            }
                    }
                    }else if self.value == "One Month Ago"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 2 || transactionee[$0].date == 0 || transactionee[$0].date == 1 || transactionee[$0].date == 3} , id: \.self){index in
                                    Transactioncategory(index: index)
                                }
                            }
                    }
                    }
                }else{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 13){
                            ForEach(transactionee.indices, id: \.self){index in
                                Transactioncategory(index: index)
                            }
                        }
                       
                    }
                }
                    
               
            }
                .padding(.top, 30)
            HStack{
                Spacer()
                Spacer()
                Button(action: {
                    withAnimation{
                        viewRouter.currentPage = .page7
                    }
                }, label: {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                    
                        .padding()
                        .background(Color("teal"))
                       
                        .clipShape(Circle())
                       
                })
            }.padding(.horizontal, 25)
            Spacer()
            
        }.background(Color("home"))
    }
}
struct CategoryReusable: View {
    @State var value = ""
    var holder = "Today"
    var dropDownList = ["Yesterday", "One Week Ago", "One Month Ago", "Today"]
    var body: some View {
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
                               .foregroundColor(.black)
                               .font(Font.custom("Poppins-Light", size: 11 ))

                           Image(systemName: "chevron.down")
                               .foregroundColor(Color.black)
                               .font(Font.custom("Poppins-Light", size: 10 ))
                       }
                   }
               }
      
    }
       }

struct Transactioncategory: View {
    let index: Int
    var body: some View{
        HStack{
            Image(transactionee[index].image)
                .resizable()
                .frame(width: 22, height: 20)
                .clipShape(Rectangle())
                .padding()
                .background(Color("icon"))
                .cornerRadius(6)
            VStack(alignment: .leading, spacing: 5){
                Text(transactionee[index].title)
                    .font(Font.custom("Poppins-Regular", size: 14 ))
                    .foregroundColor(.black)
                HStack{
                    Text(transactionee[index].category)
                        .font(Font.custom("Poppins-Light", size: 11 ))
                        .foregroundColor(.gray.opacity(0.7))
                    Text(transactionee[index].account)
                        .font(Font.custom("Poppins-Light", size: 11 ))
                        .foregroundColor(.gray.opacity(0.7))
                }
                
            }
            Spacer()
            Text("\(transactionee[index].amount) /=")
                .font(Font.custom("Poppins-Regular", size: 14 ))
                .foregroundColor(transactionee[index].cashflow == false ? Color(.red) : Color("teal"))
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 3)
        .padding(.horizontal, 25)
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewRouter: ViewRouter())
    }
}
