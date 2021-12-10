//
//  WalletView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 01/12/2021.
//

import SwiftUI

struct WalletView: View {
    @State var value = ""
    var dropDownList = ["one", "two", "three", "four"]
    var holder = "Wallet Name"
    var body: some View {
        VStack{
           
      
                    HStack{
                        Spacer()
                        Text("Wallets")
                            .font(.custom("Poppins-SemiBold", size: 18))
                            .padding(.bottom,15)
                     Spacer()
                    }    .padding(.horizontal, 25)
                    HStack{
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
                                               .foregroundColor(Color.black)
                                               .font(Font.custom("Poppins-Regular", size: 13 ))

                                           Image(systemName: "chevron.down")
                                               .foregroundColor(Color.black)
                                               .font(Font.custom("Poppins-Regular", size: 13 ))
                                       }
                                   }
                               }
                        Spacer()
                    }    .padding(.horizontal, 25)
                    
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

                            }
                           
                        }.padding(.leading, -45)
                            .padding(.bottom, 0)
                        
                    }
                        .frame(width: .infinity, height: 170)
                        .background(Color("transactions"))
                        .cornerRadius(10)
                        .padding(.top, 10)
                        .padding(.horizontal, 25)
                    HStack{
                        Text("All Expenses")
                            .font(.custom("Poppins-Regular", size: 14))
                            .padding(.bottom,15)
                        
                        Spacer()
                    }.padding(.top, 20)    .padding(.horizontal, 25)
                    ScrollView(.vertical, showsIndicators: false){
                   
                        VStack{
                            PieChart(values: [130000, 50000, 30000], names: ["Rent", "Transport", "Kidimbwi"], formatter: {value in String(format: "TZS %.0f", value)})
                            
                               
                               
                        }
                    }.padding(.bottom, 10)
                       
               
            
       
            }.padding(.top, 0)
        
           .background(Color("home"))
        }
    }


struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
