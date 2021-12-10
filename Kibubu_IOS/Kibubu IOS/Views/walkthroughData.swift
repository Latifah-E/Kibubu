//
//  walkthroughData.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 24/11/2021.
//

import Foundation
var carousel : [Slide] = [
    Slide(image: "slide1", title: "Track Expenses", content: "The simplest and quickest way to understand your finances", button: false),
    Slide(image: "slide2", title: "Track Expenses", content: "The simplest and quickest way to understand your finances", button: false),
    Slide(image: "slide3", title: "Track Expenses", content: "The simplest and quickest way to understand your finances", button: true)
]
struct Slide : Identifiable{
    var id = UUID().uuidString
    var image: String
    var title: String
    var content: String
    var button: Bool
}
