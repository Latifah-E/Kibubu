//
//  walletdata.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 25/11/2021.
//

var wallet = [
    Icon(image: "wallet1", chosen: .object1),
    Icon(image: "wallet2", chosen: .object2),
    Icon(image: "wallet3", chosen: .object3),
    Icon(image: "wallet4", chosen: .object4)
]

struct Icon {
    let image: String
    let chosen: ObjectViewer

}
