//
//  ContentView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 22/11/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var selected: SelectedIcon
    var body: some View {
        switch viewRouter.currentPage  {
        case .page1:
            SplashScreen(viewRouter: viewRouter)
        case .page2:
            RegisterView(viewRouter: viewRouter)
        case .page3:
            LoginView(viewRouter: viewRouter)
        case .page4:
            CreateWallet(viewRouter: viewRouter, selected: selected)
        case .page5:
            MenuView(viewRouter: viewRouter)
        case .page6:
            CreateTransaction(viewRouter: viewRouter)
        case .page7:
            ExpensesView(viewRouter: viewRouter)
        }
    
        
    }
        }
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter(), selected: SelectedIcon())
    }
}
