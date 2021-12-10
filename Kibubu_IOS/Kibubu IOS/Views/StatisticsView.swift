//
//  StatisticsView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 30/11/2021.
//

import SwiftUI
import Combine
struct StatisticsView: View {
    @State var tabIndex = 0
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Text("Statistics")
                    .font(.custom("Poppins-SemiBold", size: 18))
                    .padding(.bottom,15)
                Spacer()
            
                }
                   CustomTopTabBar2(tabIndex: $tabIndex)
                   if tabIndex == 0 {
                       OverView()
                   }
                   else if tabIndex == 1 {
                       VStack{
                           Spacer()
                           Text("Coming Soon ...")
                               .font(Font.custom("Poppins-Regular", size: 15 ))
                           Spacer()
                       }

                    }
                   else if tabIndex == 2  {
                       VStack{
                           Spacer()
                           Text("Coming Soon ...")
                               .font(Font.custom("Poppins-Regular", size: 15 ))
                           Spacer()
                       }
                   }
                   Spacer()
               }
                .padding(.top, 0)
                .padding(.horizontal, 25)
               .background(Color("home"))
           
           }
    }
struct OverView: View{
    @State var legend: String = ""
    @State var barColor: Color = Color("teal")
    @State var value = ""
    var dropDownList = ["Yesterday", "One Week Ago", "One Month Ago", "Today", "All"]
    var holder = "All"
    var body: some View{
        VStack{
            BarChart()
                .padding(.top, 5)
                .padding(.horizontal, 10)
                .padding(.bottom, -10)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 3)
                .padding(.horizontal, 25)
            
            VStack{
                HStack{
                    Text("All Expenses")
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
                                           .foregroundColor(Color("teal"))
                                           .font(Font.custom("Poppins-Light", size: 11 ))

                                       Image(systemName: "chevron.down")
                                           .foregroundColor(Color("teal"))
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
                                    Expensescategory(index: index)
                                }
                            }
                           
                        }
                    
                       
                    }else if self.value == "Yesterday"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 1} , id: \.self){index in
                                    Expensescategory(index: index)
                                }
                            }
                    }
                    }else if self.value == "Today"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 0} , id: \.self){index in
                                    Expensescategory(index: index)
                                }
                            }
                    }
                    }else if self.value == "One Week Ago"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 2 || transactionee[$0].date == 0 || transactionee[$0].date == 1} , id: \.self){index in
                                    Expensescategory(index: index)
                                }
                            }
                    }
                    }else if self.value == "One Month Ago"{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack(spacing: 13){
                                ForEach(transactionee.indices.filter {transactionee[$0].date == 2 || transactionee[$0].date == 0 || transactionee[$0].date == 1 || transactionee[$0].date == 3} , id: \.self){index in
                                    Expensescategory(index: index)
                                }
                            }
                    }
                    }
                }else{
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 13){
                            ForEach(transactionee.indices, id: \.self){index in
                                Expensescategory(index: index)
                            }
                        }
                       
                    }
                }
            }.padding(.top, 20)
            
          
        }.padding(.top, 20)
            .padding(.horizontal, -25)
        
    }
}

struct CustomTopTabBar2: View {
    @Binding var tabIndex: Int
    var body: some View {
        HStack(spacing:0) {
            TabBarButton2(text: "Overview", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }
               
                
                
            TabBarButton2(text: "Income", isSelected: .constant(tabIndex == 1))
                .onTapGesture { onButtonTapped(index: 1) }
            
            TabBarButton2(text: "Expenses", isSelected: .constant(tabIndex == 2))
                .onTapGesture { onButtonTapped(index: 2) }
               
        }
        .border(width: 0.4, edges: [.bottom], color: .gray)
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
        
        
    }
}
struct Expensescategory: View {
    let index: Int
    var body: some View{
        HStack{
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
        .padding(.horizontal, 25)
        .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 3)
    }
}
struct TabBarButton2: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        HStack{
            Spacer()
            Text(text)
                .foregroundColor(isSelected ? .white : .gray)
                .font(.custom("Poppins-Light", size: 14))
                .transition(.slide)
            Spacer()
        }.frame(width: .infinity, height: 40)
            .background(isSelected ? Color("teal") : Color("white"))
            
        
       
            
            
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
