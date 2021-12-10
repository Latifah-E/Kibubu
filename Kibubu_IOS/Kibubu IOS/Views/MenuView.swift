//
//  MenuView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 29/11/2021.
//

import SwiftUI

struct MenuView: View {
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            TabView{
                HomeView(viewRouter: viewRouter)
                    .tabItem{
                            Image(systemName: "house")
                                   
                    }
                
                StatisticsView()
                    .tabItem{
                            Image(systemName: "chart.bar")
                                   
                    }
                
                
                WalletView()
                    .tabItem{
                            Image(systemName: "chart.pie")
                                   
                    }
                
               Text("Coming soon...")
                    .font(Font.custom("Poppins-light", size: 17 ))
                    .tabItem{
                            Image( systemName: "dollarsign.circle")
                                   
                    }
                
            }.background(Color.white)
                .onAppear{
                    UITabBar.appearance().backgroundColor = UIColor(red: 0.976, green: 0.976, blue: 0.976, alpha: 1.00)
                }
                .tabViewStyle(backgroundColor: .white,
                               itemColor: .gray.opacity(0.3),
                               selectedItemColor: Color("teal"))        }
    }
}
extension Color {
  var uiColor: UIColor? {
    if #available(iOS 14.0, *) {
      return UIColor(self)
    } else {
      let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
      var hexNumber: UInt64 = 0
      var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
      let result = scanner.scanHexInt64(&hexNumber)
      if result {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                 g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                 b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                 a = CGFloat(hexNumber & 0x000000ff) / 255
        return UIColor(red: r, green: g, blue: b, alpha: a)
      } else {
        return nil
      }
    }
  }
}
extension UIImage {
    static func gradientImageWithBounds(bounds: CGRect, colors: [CGColor]) -> UIImage {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
extension View {

  func tabViewStyle(backgroundColor: Color? = nil,
                    itemColor: Color? = nil,
                    selectedItemColor: Color? = nil,
                    badgeColor: Color? = nil) -> some View {
    onAppear {
      let itemAppearance = UITabBarItemAppearance()
        let image = UIImage.gradientImageWithBounds(
            bounds: CGRect( x: 2, y: 10, width: UIScreen.main.scale, height: 55),
            colors: [
                UIColor.clear.cgColor,
                UIColor.gray.withAlphaComponent(0.01).cgColor
            ]
        )
      if let uiItemColor = itemColor?.uiColor {
        itemAppearance.normal.iconColor = uiItemColor
        itemAppearance.normal.titleTextAttributes = [
          .foregroundColor: uiItemColor
        ]
          itemAppearance.normal.titleTextAttributes = [
            .foregroundColor: uiItemColor,
            .font: UIFont(name: "Poppins-Light", size: 11)
          ]
      }
      if let uiSelectedItemColor = selectedItemColor?.uiColor {
        itemAppearance.selected.iconColor = uiSelectedItemColor
        itemAppearance.selected.titleTextAttributes = [
          .foregroundColor: uiSelectedItemColor
        ]
      }
      if let uiBadgeColor = badgeColor?.uiColor {
        itemAppearance.normal.badgeBackgroundColor = uiBadgeColor
        itemAppearance.selected.badgeBackgroundColor = uiBadgeColor
      }

      let appearance = UITabBarAppearance()
      if let uiBackgroundColor = backgroundColor?.uiColor {
          appearance.backgroundColor = uiBackgroundColor
          appearance.configureWithTransparentBackground()
          appearance.backgroundImage = UIImage()
          appearance.shadowImage = image
          

          UITabBar.appearance().standardAppearance = appearance
      }

      appearance.stackedLayoutAppearance = itemAppearance
      appearance.inlineLayoutAppearance = itemAppearance
      appearance.compactInlineLayoutAppearance = itemAppearance

      UITabBar.appearance().standardAppearance = appearance
      if #available(iOS 15.0, *) {
        UITabBar.appearance().scrollEdgeAppearance = appearance
      }
    }
  }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewRouter: ViewRouter())
    }
}
