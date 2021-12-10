//
//  transactions.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 29/11/2021.
//

var transactionee = [
    Payment(image: "book", date: 0, title: "Library", category: "Leisure Cash", amount: -12000, cashflow: false, account: "M-pesa" ),
    Payment(image: "food", date: 0, title: "Ndizi Choma", category: "Food", amount: 10000, cashflow: true, account: "Cash"),
    Payment(image: "cart", date: 0, title: "Library", category: "Shopping", amount: -17000, cashflow: false,  account: "Cash" ),
    Payment(image: "dollar", date: 0, title: "Donald Payment", category: "Allowance", amount: -12000, cashflow: false, account: "M-pesa" ),
    Payment(image: "book", date: 1, title: "Maison", category: "Leisure Cash", amount: 22000, cashflow: true ,  account: "Cash"),
    Payment(image: "food", date: 1, title: "Ndizi Choma", category: "Leisure Cash", amount: -12400, cashflow: false,  account: "Cash" ),
    Payment(image: "cart", date: 2, title: "Library", category: "Leisure Cash", amount: -52000, cashflow: false ,  account: "M-pesa"),
    Payment(image: "dollar", date: 3, title: "Donald Payment", category: "Allowance", amount: 8000, cashflow: true,  account: "Cash" ),
    Payment(image: "cart", date: 2, title: "Kidimbwi", category: "Leisure Cash", amount: -52000, cashflow: false ,  account: "M-pesa"),
    Payment(image: "dollar", date: 3, title: "Donald Payment", category: "Allowance", amount: 8000, cashflow: true,  account: "Cash" ),
    Payment(image: "cart", date: 2, title: "Library", category: "Leisure Cash", amount: -52000, cashflow: false ,  account: "M-pesa"),
    Payment(image: "dollar", date: 4, title: "Kidimbwi", category: "Allowance", amount: 8000, cashflow: false,  account: "Cash" ),
    Payment(image: "cart", date: 4, title: "Library", category: "Leisure Cash", amount: -52000, cashflow: false ,  account: "M-pesa"),
    Payment(image: "dollar", date: 4, title: "Donald Payment", category: "Allowance", amount: 8000, cashflow: true,  account: "Cash" ),
    Payment(image: "cart", date: 4, title: "Library", category: "Leisure Cash", amount: -52000, cashflow: false ,  account: "M-pesa"),
    Payment(image: "dollar", date: 4, title: "Donald Payment", category: "Allowance", amount: 8000, cashflow: true,  account: "Cash" )
    ]

struct Payment {
    let image: String
    let date: Int
//    0 for today
//    1 for yesterday
//    2 for one week ago
//    3 for month week ago
    let title: String
    let category: String
    let amount: Int
    let cashflow: Bool
    let account: String
//    to check if its an inflor or outflow
//    false for outfow, true for inflow
    
    
    

}

