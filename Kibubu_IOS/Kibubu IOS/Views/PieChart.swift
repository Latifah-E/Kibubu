//
//  PieChart.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 01/12/2021.
//

import SwiftUI

struct PieChart: View {
    public let values: [Double]
       public let names: [String]
       public let formatter: (Double) -> String
       
       public var colors: [Color]
       public var backgroundColor: Color
       
       public var widthFraction: CGFloat
       public var innerRadiusFraction: CGFloat
       
       @State private var activeIndex: Int = -1
    
    var slices: [PieSliceData] {
            let sum = values.reduce(0, +)
            var endDeg: Double = 0
            var tempSlices: [PieSliceData] = []
            
            for (i, value) in values.enumerated() {
                let degrees: Double = value * 360 / sum
                tempSlices.append(PieSliceData(startAngle: Angle(degrees: endDeg), endAngle: Angle(degrees: endDeg + degrees), text: String(format: "%.0f%%", value * 100 / sum), color: self.colors[i]))
                endDeg += degrees
            }
            return tempSlices
        }
    public init(values:[Double], names: [String], formatter: @escaping (Double) -> String, colors: [Color] = [Color(red: 104 / 255, green: 87 / 255, blue: 232 / 255, opacity: 1.0) , Color(red: 251 / 255, green: 129 / 255, blue: 83 / 255, opacity: 1.0) , Color(red: 255 / 255, green: 213 / 255, blue: 114 / 255, opacity: 1.0) ], backgroundColor: Color = Color.white  , widthFraction: CGFloat = 0.75, innerRadiusFraction: CGFloat = 0.60){
            self.values = values
            self.names = names
            self.formatter = formatter
            
            self.colors = colors
            self.backgroundColor = backgroundColor
            self.widthFraction = widthFraction
            self.innerRadiusFraction = innerRadiusFraction
        }
    var body: some View {
        GeometryReader { geometry in
                    VStack{
                        HStack{
                            Spacer()
                            ZStack{
                                ForEach(0..<self.values.count){ i in
                                    PieSlice(pieSliceData: self.slices[i])
                                        .scaleEffect(self.activeIndex == i ? 1.1 : 1)
                                        .animation(Animation.spring())
                                }
                                .frame(width: widthFraction * geometry.size.width, height: widthFraction * geometry.size.width)
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onChanged { value in
                                            let radius = 0.5 * widthFraction * geometry.size.width
                                            let diff = CGPoint(x: value.location.x - radius, y: radius - value.location.y)
                                            
                                            let dist = pow(pow(diff.x, 2.0) + pow(diff.y, 2.0), 0.5)
                                            
                                            if (dist > radius || dist < radius * innerRadiusFraction) {
                                                self.activeIndex = -1
                                                return
                                            }
                                            
                                            var radians = Double(atan2(diff.x, diff.y))
                                            if (radians < 0) {
                                                radians = 2 * Double.pi + radians
                                            }
                                            
                                            for (i, slice) in slices.enumerated() {
                                                if (radians < slice.endAngle.radians) {
                                                    self.activeIndex = i
                                                    break
                                                }
                                            }
                                        }
                                        .onEnded { value in
                                            self.activeIndex = -1
                                        }
                                )
                                Circle()
                                    .fill(self.backgroundColor)
                                    .frame(width: widthFraction * geometry.size.width * innerRadiusFraction, height: widthFraction * geometry.size.width * innerRadiusFraction)
                                
                                VStack {
                                    Text(self.activeIndex == -1 ? "Total" : names[self.activeIndex])
                                        .font(.custom("Poppins-SemiBold", size: 18))
                                        .foregroundColor(Color("teal"))
                                    Text(self.formatter(self.activeIndex == -1 ? values.reduce(0, +) : values[self.activeIndex]))
                                        .font(.custom("Poppins-Light", size: 15))
                                        .foregroundColor(Color.black)
                                }
                                
                            }.padding(.vertical, 35)
                            Spacer()
                        }
                        .background(self.backgroundColor)
                        .cornerRadius(15)
                        .shadow(color: Color.gray.opacity(0.2), radius: 8, x: 0, y: 3)
                       Spacer()
                        PieChartRows(colors: self.colors, names: self.names, values: self.values.map { self.formatter($0) }, percents: self.values.map { String(format: "%.0f%%", $0 * 100 / self.values.reduce(0, +)) })
                            .padding(.top, 30)
                        
                    }.padding(.horizontal, 25)
                  
                    
                }
            }
    
}
struct PieChartRows: View {
    var colors: [Color]
    var names: [String]
    var values: [String]
    var percents: [String]
    
    var body: some View {
        VStack(spacing: 10){
            ForEach(0..<self.values.count){ i in
                HStack {
                    Circle()
                        .fill(self.colors[i])
                        .frame(width: 12, height: 12)
                        .padding(.bottom, 15)
                    VStack{
                        HStack{
                            Text(self.names[i])
                                .font(.custom("Poppins-Regular", size: 13))
                                .foregroundColor(.black)
                            Spacer()
                        }.padding(.bottom, 0)
                        HStack{
                            Text(self.values[i])
                                .font(.custom("Poppins-light", size: 11))
                                .foregroundColor(.red)
                            Spacer()
                        }
                        
                    }.padding(.leading,5)
                    
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(self.percents[i])
                            .font(.custom("Poppins-regular", size: 13))
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}
struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart(values: [130000, 50000, 30000], names: ["Rent", "Transport", "Kidimbwi"], formatter: {value in String(format: "TZS %.0f", value)})
    }
}
