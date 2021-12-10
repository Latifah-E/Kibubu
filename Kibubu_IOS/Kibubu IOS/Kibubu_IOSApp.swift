//
//  Kibubu_IOSApp.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 22/11/2021.
//

import SwiftUI

@main
struct Kibubu_IOSApp: App {
    @StateObject var viewRouter = ViewRouter()
    @StateObject var selected = SelectedIcon()
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter, selected: selected)
                .preferredColorScheme(.light)
        }
    }
}
