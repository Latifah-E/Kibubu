//
//  BarChart.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 30/11/2021.
//

import SwiftUI

struct BarChart: View {
        
        @State var data: [ChartData] = chartDataSet
        @State var data2: [ChartData] = monthlyDataSet
        @State private var currentValue = ""
        @State private var currentLabel = ""
        @State private var touchLocation: CGFloat = -1
        @State var value = ""
        var dropDownList = ["Weekly", "Monthly"]
        var holder = "Weekly"
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(value == "Monthly" ? "This Year's Expenses" : "Last Week's Expenses")
                            .font(.custom("Poppins-Regular", size: 14))
                            .foregroundColor(.black)
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
            }
            Text(value == "Monthly" ? "\(Int(monthlyDataSet.map{$0.value}.reduce(0, +)))/=" : "\(Int(chartDataSet.map{$0.value}.reduce(0, +)))/=")
                            .font(.custom("Poppins-Regular", size: 13))
                            .padding(.top,1)
                            .foregroundColor(.gray)
            
            if self.value != ""{
                
                
                if self.value == "Monthly"{
                    withAnimation{
                        GeometryReader { geometry in
                            VStack {
                                VStack{
                                    HStack {
                                        ForEach(0..<data2.count , id: \.self) { i in
                                            VStack{
                                                BarChartCell(value: normalizedValue(index: i), barColor: Color("teal"))
                                                    .opacity(barIsTouched(index: i) ? 0.7 : 1)
                                                    .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                                    .animation(.spring())
                                                    .padding(.top)
                                                Text(data2[i].label)
                                                    .font(.custom("Poppins-Light", size: 9))
                                                    .foregroundColor(.gray)
                                            }
                                           
                                        
                                        }
                                    }
                                    
                                      
                                }
                                
                                    .gesture(DragGesture(minimumDistance: 0)
                                        .onChanged({ position in
                                            let touchPosition = position.location.x/geometry.frame(in: .local).width
                                                                    
                                            touchLocation = touchPosition
                                            updateCurrentValue()
                                        })
                                        .onEnded({ position in
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation(Animation.easeOut(duration: 0.5)) {
                                                    resetValues()
                                                }
                                            }
                                        })
                                    )
                                if currentLabel.isEmpty {
                                                       Text("")
                                                           .bold()
                                                           .foregroundColor(.black)
                                                           .padding(8)
                                                   }
                                else {
                                                       Text(currentValue)
                                                           .font(.custom("Poppins-Regular", size: 14))
                                                           .foregroundColor(Color("teal"))
                                                           .padding(5)
                                                           .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                                                           .offset(x: labelOffset(in: geometry.frame(in: .local).width))
                                                           .animation(.easeIn)
                                                   }
                                
                            }
                        }
                    }
                   
                    
                }
                else{
                    withAnimation{
                        GeometryReader { geometry in
                            VStack {
                                VStack{
                                    HStack {
                                        ForEach(0..<data.count , id: \.self) { i in
                                            VStack{
                                                BarChartCell(value: normalizedValue(index: i), barColor: Color("teal"))
                                                    .opacity(barIsTouched(index: i) ? 0.7 : 1)
                                                    .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                                    .animation(.spring())
                                                    .padding(.top)
                                                Text(data[i].label)
                                                    .font(.custom("Poppins-Light", size: 9))
                                                    .foregroundColor(.gray)
                                            }
                                           
                                        
                                        }
                                    }
                                    
                                      
                                }
                                
                                    .gesture(DragGesture(minimumDistance: 0)
                                        .onChanged({ position in
                                            let touchPosition = position.location.x/geometry.frame(in: .local).width
                                                                    
                                            touchLocation = touchPosition
                                            updateCurrentValue()
                                        })
                                        .onEnded({ position in
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                                withAnimation(Animation.easeOut(duration: 0.5)) {
                                                    resetValues()
                                                }
                                            }
                                        })
                                    )
                                if currentLabel.isEmpty {
                                                       Text("")
                                                           .bold()
                                                           .foregroundColor(.black)
                                                           .padding(8)
                                                   }
                                else {
                                                       Text(currentValue)
                                                           .font(.custom("Poppins-Regular", size: 14))
                                                           .foregroundColor(Color("teal"))
                                                           .padding(5)
                                                           .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                                                           .offset(x: labelOffset(in: geometry.frame(in: .local).width))
                                                           .animation(.easeIn)
                                                   }
                                
                            }
                        }
                    }
                   
                    
                }
            }else{
                GeometryReader { geometry in
                    VStack {
                        VStack{
                            HStack {
                                ForEach(0..<data.count , id: \.self) { i in
                                    VStack{
                                        BarChartCell(value: normalizedValue(index: i), barColor: Color("teal"))
                                            .opacity(barIsTouched(index: i) ? 0.7 : 1)
                                            .scaleEffect(barIsTouched(index: i) ? CGSize(width: 1.05, height: 1) : CGSize(width: 1, height: 1), anchor: .bottom)
                                            .animation(.spring())
                                            .padding(.top)
                                        Text(data[i].label)
                                            .font(.custom("Poppins-Light", size: 9))
                                            .foregroundColor(.gray)
                                    }
                                   
                                
                                }
                            }
                            
                              
                        }
                        
                            .gesture(DragGesture(minimumDistance: 0)
                                .onChanged({ position in
                                    let touchPosition = position.location.x/geometry.frame(in: .local).width
                                                            
                                    touchLocation = touchPosition
                                    updateCurrentValue()
                                })
                                .onEnded({ position in
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation(Animation.easeOut(duration: 0.5)) {
                                            resetValues()
                                        }
                                    }
                                })
                            )
                        if currentLabel.isEmpty {
                                               Text("")
                                                   .bold()
                                                   .foregroundColor(.black)
                                                   .padding(8)
                                           }
                        else {
                                               Text(currentValue)
                                                   .font(.custom("Poppins-Regular", size: 14))
                                                   .foregroundColor(Color("teal"))
                                                   .padding(5)
                                                   .background(RoundedRectangle(cornerRadius: 5).foregroundColor(.white).shadow(radius: 3))
                                                   .offset(x: labelOffset(in: geometry.frame(in: .local).width))
                                                   .animation(.easeIn)
                                           }
                        
                    }
                }
            }
                  
               }
                   .padding()
                  
    }

    func normalizedValue(index: Int) -> Double {
        if self.value == "Monthly" {
                var allValues: [Double]    {
                    var values = [Double]()
                    for data2 in data2 {
                        values.append(data2.value)
                    }
                    return values
                }
                guard let max = allValues.max() else {
                         return 1
                }
                if max != 0 {
                    return Double(data2[index].value)/Double(max)
                } else {
                    return 1
                }
        }else{
            var allValues: [Double]    {
                var values = [Double]()
                for data in data {
                    values.append(data.value)
                }
                return values
            }
            guard let max = allValues.max() else {
                     return 1
            }
            if max != 0 {
                return Double(data[index].value)/Double(max)
            } else {
                return 1
            }
        }
           
       }

  
       func barIsTouched(index: Int) -> Bool {
           if self.value == "Monthly" {
               return touchLocation > CGFloat(index)/CGFloat(data2.count) && touchLocation < CGFloat(index+1)/CGFloat(data2.count)
           }else{
               return touchLocation > CGFloat(index)/CGFloat(data.count) && touchLocation < CGFloat(index+1)/CGFloat(data.count)
           }
           
       }
       
       func updateCurrentValue()    {
           if self.value == "Monthly"{
               let index = Int(touchLocation * CGFloat(data2.count))
               guard index < data2.count && index >= 0 else {
                   currentValue = ""
                   currentLabel = ""
                   return
               }
               currentValue = "\(Int(data2[index].value))/="
               currentLabel = data2[index].label
           }else{
               let index = Int(touchLocation * CGFloat(data.count))
               guard index < data.count && index >= 0 else {
                   currentValue = ""
                   currentLabel = ""
                   return
               }
               currentValue = "\(Int(data[index].value))/="
               currentLabel = data[index].label
           }
           
       }
       
       func resetValues() {
           touchLocation = -1
           currentValue  =  ""
           currentLabel = ""
       }
       
       func labelOffset(in width: CGFloat) -> CGFloat {
           
           if self.value == "Monthly"{
               let currentIndex = Int(touchLocation * CGFloat(data2.count))
               guard currentIndex < data2.count && currentIndex >= 0 else {
                   return 0
               }
               let cellWidth = width / CGFloat(data2.count)
               let actualWidth = width -    cellWidth
               let position = cellWidth * CGFloat(currentIndex) - actualWidth/2
               return position
           }else{
               let currentIndex = Int(touchLocation * CGFloat(data.count))
               guard currentIndex < data.count && currentIndex >= 0 else {
                   return 0
               }
               let cellWidth = width / CGFloat(data.count)
               let actualWidth = width -    cellWidth
               let position = cellWidth * CGFloat(currentIndex) - actualWidth/2
               return position
           }
           
       }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart()
    }
}
    
