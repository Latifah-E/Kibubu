//
//  ExpensesView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 30/11/2021.
//

import SwiftUI

struct ExpensesView: View {
    @StateObject var viewRouter: ViewRouter
    @State var tabIndex2 = 0
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    withAnimation{
                        viewRouter.currentPage = .page5
                    }
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .font(.custom("Poppins-Light", size: 14))
                        .padding(.bottom, 10)
                })
               
                Spacer()
                Text("Income")
                    .font(.custom("Poppins-SemiBold", size: 18))
                    .padding(.bottom,15)
                    .padding(.leading, -10)
                Spacer()
            
                }
                   CustomTopTabBar(tabIndex2: $tabIndex2)
                   if tabIndex2 == 0 {
                       FirstView(viewRouter: viewRouter)
                   }
                   else {
                       SecondView(viewRouter: viewRouter)
                   }
                   Spacer()
               }
                .background(Color("home"))
                .padding(.top, 0)
                .padding(.horizontal, 25)
               .background(Color("home"))
              
           
           }
    }
extension Date {
        func formatDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMM dd YYYY ")
            return dateFormatter.string(from: self)
        }
}
class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
struct FirstView: View{
    @State private var note = NumbersOnly()
    @State private var date = Date()
    @ObservedObject var amount = NumbersOnly()
    @State private var value: String = ""
    var holder = "Type"
    var dropDownList = ["Cash", "M-Pesa"]
    @State private var value2: String = ""
    var holder2 = "Choose"
    var dropDownList2 = ["Allowance", "Leisure", "Entertainment", "Payment"]
    @State var showDatePicker: Bool = false
    let today = Date().formatDate()
    @State var savedDate: Date? = nil
    @StateObject var viewRouter: ViewRouter
    @State var show = false
    var body: some View{
        VStack(spacing: 25){
            ZStack{
                VStack{
                    HStack{
                        Text("Date")
                           .font(.custom("Poppins-Light", size: 15))
                           .foregroundColor(.black.opacity(0.6))
                        Spacer()
                    }.padding(.bottom, 3)
                    
                    ZStack {
                                HStack {
                                    Text(savedDate?.formatted(date: .long, time: .omitted) ?? today)
                                        .font(.custom("Poppins-Light", size: 13))
                                        .foregroundColor(.black)
                                    Spacer()
                                    
                                    Button(action: {
                                        withAnimation{
                                            showDatePicker.toggle()
                                        }
                                        
                                    }, label: {
                                        Image(systemName: "calendar")
                                            .foregroundColor(.black.opacity(0.7))
                                    })
                                }
                                

                              
                            }
                   
                        
                }
                .padding(.bottom, 10)
                .border(width: 0.4, edges: [.bottom], color: .gray)
                if showDatePicker {
                    DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
                        .animation(.linear)
                        .transition(.opacity)
                }
            }
        
            
            VStack{
                HStack{
                    Text("Account")
                       .font(.custom("Poppins-Light", size: 15))
                       .foregroundColor(.black.opacity(0.6))
                    Spacer()
                }.padding(.bottom, 3)
                
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
                                       .foregroundColor(value.isEmpty ? .black : .black)
                                       .font(Font.custom("Poppins-Light", size: 13 ))
                                   Spacer()
                                   Image(systemName: "chevron.down")
                                       .foregroundColor(Color.black)
                                       .font(Font.system(size: 10))
                                       .padding(.trailing, 5)
                               }
                               
                               
                               
                           }
                       }
            }.padding(.bottom, 10)
                .border(width: 0.4, edges: [.bottom], color: .gray)
            
            VStack{
                HStack{
                    Text("Category")
                       .font(.custom("Poppins-Light", size: 15))
                       .foregroundColor(.black.opacity(0.6))
                    Spacer()
                }.padding(.bottom, 3)
                
                Menu {
                            ForEach(dropDownList2, id: \.self){ client in
                                Button(client) {
                                    self.value2 = client
                                }
                            }
                } label: {
                           VStack(spacing: 5){
                               HStack{
                                   Text(value2.isEmpty ? holder2 : value2)
                                       .foregroundColor(value.isEmpty ? .black : .black)
                                       .font(Font.custom("Poppins-Light", size: 13 ))
                                   Spacer()
                                   Image(systemName: "chevron.down")
                                       .foregroundColor(Color.black)
                                       .font(Font.system(size: 10))
                                       .padding(.trailing, 5)
                               }
                               
                               
                               
                           }
                       }
            }.padding(.bottom, 10)
                .border(width: 0.4, edges: [.bottom], color: .gray)
            
            VStack{
                if !self.show{
                    VStack{
                        HStack{
                            Text("Amount")
                               .font(.custom("Poppins-Light", size: 15))
                               .foregroundColor(.black.opacity(0.6))
                            Spacer()
                        }.padding(.bottom, 3)
                        TextField("", text: $amount.value)
                            .font(Font.custom("Poppins-Light", size: 13 ))
                            .foregroundColor(.black)
                            .keyboardType(.decimalPad)
                            
                    }.onTapGesture {
                        self.show.toggle()
                    }
                    
                }else{
                    VStack{
                        HStack{
                            Text("Amount")
                               .font(.custom("Poppins-Light", size: 15))
                               .foregroundColor(.black.opacity(0.6))
                            Spacer()
                            Button(action: {
                                
                                withAnimation {
                                    
                                    self.show.toggle()
                                    UIApplication.shared.dismissKeyboard()
                                }
                                
                            }) {
                                
                                Image(systemName: "xmark").foregroundColor(.black)
                                    
                            }
                            .padding(.horizontal, 0)
                            .font(Font.custom("Poppins-Light", size: 12 ))
                        }.padding(.bottom, 3)
                        TextField("", text: $amount.value)
                            .font(Font.custom("Poppins-Light", size: 13 ))
                            .foregroundColor(.black)
                            .keyboardType(.decimalPad)
                    }
                    
                }
                
                
            }.padding(.bottom, 10)
             .border(width: 0.4, edges: [.bottom], color: .gray)
            
            VStack{
                HStack{
                    Text("Note")
                       .font(.custom("Poppins-Light", size: 15))
                       .foregroundColor(.black.opacity(0.6))
                    Spacer()
                }.padding(.bottom, 3)
                TextField("", text: $note.value)
                    .font(Font.custom("Poppins-Light", size: 13 ))
                    .foregroundColor(.black)
                    .keyboardType(.decimalPad)
            }.padding(.bottom, 10)
             .border(width: 0.4, edges: [.bottom], color: .gray)
            
             Spacer()
            HStack{
                Button(action: {
                    withAnimation{
                        viewRouter.currentPage = .page5
                    }
                }, label: {
                    HStack{
                        Spacer()
                    Text("Save")
                        .font(Font.custom("Poppins-Light", size: 14 ))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        Spacer()
                    }
                       
                }) .padding(.vertical, 15)
            .background(Color("teal"))
            .cornerRadius(10)
            }
            
                        
        }.padding(.top, 25)
    }
}
extension Date {
        func PickedDate() -> String {
                let dateFormatter = DateFormatter()
            dateFormatter.setLocalizedDateFormatFromTemplate("dd MMMM YYYY ")
            return dateFormatter.string(from: self)
        }
}
extension UIApplication {
      func dismissKeyboard() {
          sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
      }
  }



struct DatePickerWithButtons: View {
    
    @Binding var showDatePicker: Bool
    @Binding var savedDate: Date?
    @State var selectedDate: Date = Date()
    
    var body: some View {

            
            
            
            VStack {
                DatePicker(selection: $selectedDate, displayedComponents: [.date]){
                    Text("Date:")
                        .font(.custom("Poppins-Light", size: 13))
                        .foregroundColor(.black)
                }
                
                Divider()
                HStack {
                    
                    Button(action: {
                        withAnimation{
                            showDatePicker = false
                        }
                        
                    }, label: {
                        Text("Cancel")
                            .font(.custom("Poppins-Light", size: 13))
                            .foregroundColor(.blue)
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation{
                            savedDate = selectedDate
                            showDatePicker = false
                        }
                        
                    }, label: {
                        Text("Save".uppercased())
                            .bold()
                            .font(.custom("Poppins-Light", size: 13))
                            .foregroundColor(.blue)
                    })
                    
                }

            }
        
            .padding()
            .frame(width: .infinity, height: 150)
            
            
            .background(
                Color.white
            )
            .cornerRadius(30)
            .shadow(color: Color.gray.opacity(0.5), radius: 8, x: 0, y: 3)
           
            

            

    }
}

struct SecondView: View{
    @State private var note = NumbersOnly()
    @State private var date = Date()
    @ObservedObject var amount = NumbersOnly()
    @State private var value: String = ""
    var holder = "Type"
    var dropDownList = ["Cash", "M-Pesa"]
    @State private var value2: String = ""
    var holder2 = "Choose"
    var dropDownList2 = ["Allowance", "Leisure", "Entertainment", "Payment"]
    @State var showDatePicker: Bool = false
    let today = Date().formatDate()
    @State var savedDate: Date? = nil
    @StateObject var viewRouter: ViewRouter
    var body: some View{
        VStack(spacing: 25){
            ZStack{
                VStack{
                    HStack{
                        Text("Date")
                           .font(.custom("Poppins-Light", size: 15))
                           .foregroundColor(.black.opacity(0.6))
                        Spacer()
                    }.padding(.bottom, 3)
                    
                    ZStack {
                                HStack {
                                    Text(savedDate?.formatted(date: .long, time: .omitted) ?? today)
                                        .font(.custom("Poppins-Light", size: 13))
                                        .foregroundColor(.black)
                                    Spacer()
                                    
                                    Button(action: {
                                        withAnimation{
                                            showDatePicker.toggle()
                                        }
                                        
                                    }, label: {
                                        Image(systemName: "calendar")
                                            .foregroundColor(.black.opacity(0.7))
                                    })
                                }
                                

                              
                            }
                   
                        
                }
                .padding(.bottom, 10)
                .border(width: 0.4, edges: [.bottom], color: .gray)
                if showDatePicker {
                    DatePickerWithButtons(showDatePicker: $showDatePicker, savedDate: $savedDate, selectedDate: savedDate ?? Date())
                        .animation(.linear)
                        .transition(.opacity)
                }
            }
        
            
            VStack{
                HStack{
                    Text("Account")
                       .font(.custom("Poppins-Light", size: 15))
                       .foregroundColor(.black.opacity(0.6))
                    Spacer()
                }.padding(.bottom, 3)
                
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
                                       .foregroundColor(value.isEmpty ? .black : .black)
                                       .font(Font.custom("Poppins-Light", size: 13 ))
                                   Spacer()
                                   Image(systemName: "chevron.down")
                                       .foregroundColor(Color.black)
                                       .font(Font.system(size: 10))
                                       .padding(.trailing, 5)
                               }
                               
                               
                               
                           }
                       }
            }.padding(.bottom, 10)
                .border(width: 0.4, edges: [.bottom], color: .gray)
            
            VStack{
                HStack{
                    Text("Category")
                       .font(.custom("Poppins-Light", size: 15))
                       .foregroundColor(.black.opacity(0.6))
                    Spacer()
                }.padding(.bottom, 3)
                
                Menu {
                            ForEach(dropDownList2, id: \.self){ client in
                                Button(client) {
                                    self.value2 = client
                                }
                            }
                } label: {
                           VStack(spacing: 5){
                               HStack{
                                   Text(value2.isEmpty ? holder2 : value2)
                                       .foregroundColor(value.isEmpty ? .black : .black)
                                       .font(Font.custom("Poppins-Light", size: 13 ))
                                   Spacer()
                                   Image(systemName: "chevron.down")
                                       .foregroundColor(Color.black)
                                       .font(Font.system(size: 10))
                                       .padding(.trailing, 5)
                               }
                               
                               
                               
                           }
                       }
            }.padding(.bottom, 10)
                .border(width: 0.4, edges: [.bottom], color: .gray)
            
            VStack{
                HStack{
                    Text("Amount")
                       .font(.custom("Poppins-Light", size: 15))
                       .foregroundColor(.black.opacity(0.6))
                    Spacer()
                }.padding(.bottom, 3)
                TextField("", text: $amount.value)
                    .font(Font.custom("Poppins-Light", size: 13 ))
                    .foregroundColor(.black)
                    .keyboardType(.decimalPad)
            }.padding(.bottom, 10)
             .border(width: 0.4, edges: [.bottom], color: .gray)
            
            VStack{
                HStack{
                    Text("Note")
                       .font(.custom("Poppins-Light", size: 15))
                       .foregroundColor(.black.opacity(0.6))
                    Spacer()
                }.padding(.bottom, 3)
                TextField("", text: $note.value)
                    .font(Font.custom("Poppins-Light", size: 13 ))
                    .foregroundColor(.black)
                    .keyboardType(.decimalPad)
            }.padding(.bottom, 10)
             .border(width: 0.4, edges: [.bottom], color: .gray)
            
             Spacer()
            HStack{
                Button(action: {
                    withAnimation{
                        viewRouter.currentPage = .page5
                    }
                }, label: {
                    HStack{
                        Spacer()
                    Text("Save")
                        .font(Font.custom("Poppins-Light", size: 14 ))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        Spacer()
                    }
                       
                }) .padding(.vertical, 15)
            .background(Color("teal"))
            .cornerRadius(10)
            }
            
                        
        }.padding(.top, 25)
    }
}
   
struct CustomTopTabBar: View {
    @Binding var tabIndex2: Int
    var body: some View {
        HStack(spacing:0) {
            TabBarButton(text: "Income", isSelected: .constant(tabIndex2 == 0))
                .onTapGesture { onButtonTapped(index: 0) }
               
                
                
            TabBarButton(text: "Expenses", isSelected: .constant(tabIndex2 == 1))
                .onTapGesture { onButtonTapped(index: 1) }
               
         
        }
        .border(width: 0.4, edges: [.bottom], color: .gray)
    }
    
    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex2 = index }
        
        
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        HStack{
            Spacer()
            Text(text)
                .foregroundColor(isSelected ? .white : .red)
                .font(.custom("Poppins-Light", size: 14))
                .transition(.slide)
            Spacer()
        }.frame(width: .infinity, height: 40)
            .background(isSelected ? Color("teal") : Color("white"))
        
       
            
            
    }
}

struct EdgeBorder: Shape {

    var width: CGFloat
    var edges: [Edge]

    func path(in rect: CGRect) -> Path {
        var path = Path()
        for edge in edges {
            var x: CGFloat {
                switch edge {
                case .top, .bottom, .leading: return rect.minX
                case .trailing: return rect.maxX - width
                }
            }

            var y: CGFloat {
                switch edge {
                case .top, .leading, .trailing: return rect.minY
                case .bottom: return rect.maxY - width
                }
            }

            var w: CGFloat {
                switch edge {
                case .top, .bottom: return rect.width
                case .leading, .trailing: return self.width
                }
            }

            var h: CGFloat {
                switch edge {
                case .top, .bottom: return self.width
                case .leading, .trailing: return rect.height
                }
            }
            path.addPath(Path(CGRect(x: x, y: y, width: w, height: h)))
        }
        return path
    }
}

extension View {
    func border(width: CGFloat, edges: [Edge], color: SwiftUI.Color) -> some View {
        overlay(EdgeBorder(width: width, edges: edges).foregroundColor(color))
    }
}
struct ExpensesView_Previews: PreviewProvider {
    static var previews: some View {
        ExpensesView(viewRouter: ViewRouter())
    }
}
