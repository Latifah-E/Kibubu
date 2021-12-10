//
//  BarChartCell.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 30/11/2021.
//

import SwiftUI

struct BarChartCell: View {
    
    var value: Double
    var barColor: Color
                             
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .fill(barColor)
            .scaleEffect(CGSize(width: 1, height: value), anchor: .bottom)
                    
    }
}

struct BarChartCell_Previews: PreviewProvider {
    static var previews: some View {
        BarChartCell(value: 3800, barColor: Color("teal"))
            .previewLayout(.sizeThatFits)
    }
}
