//
//  Walkthrough.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 24/11/2021.
//

import SwiftUI

struct Walkthrough: View {
    @State private var selection : Int = 0
    @State var index : Int = 0
    @StateObject var viewRouter: ViewRouter
    var screenSize : CGSize
    @State var offset: CGFloat = 0
    var body: some View {
        VStack{
            OffsetPagetabView(offset: $offset){
                HStack(spacing: 0){
                    
                    ForEach(carousel){index in
                        VStack{
                            Image(index.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:.infinity)
                            Text(index.title)
                                .font(Font.custom("Poppins-Bold", size: 24 ))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("walkthrough"))
                                .padding()
                                .padding(.top, 30)
                            Text(index.content)
                                .font(Font.custom("Poppins-Light", size: 18 ))
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color("walkthrough"))
                              
                           
                               
                            
                        }.background(Color.white)
                            .padding(40)
                            .padding(.bottom, 80)
                            .frame(width: screenSize.width)
                        
                    }
                }.background(Color.white)

            } .background(Color.white)
            HStack{
                HStack(spacing: 9){
                    ForEach(carousel.indices, id: \.self){index in
                        Capsule()
                            .fill(Color("teal").opacity(0.3))
                            .frame(width: getIndex() == index ? 20 : 7, height: 7)
                        
                    }
                }
                .overlay(
                Capsule()
                    .fill(Color("teal"))
                    .frame(width: 20, height: 7)
                .offset(x: getIndicatorOffset() - 16)
                )
                .offset(x: 0, y: -100)
            }.background(Color.white)
            
            HStack(alignment: .bottom){
                if self.offset == 2 * screenSize.width{
                    VStack{
                        Button(action: {
                            withAnimation{
                                viewRouter.currentPage = .page3
                            }
                        }, label: {
                            HStack{
                                Spacer()
                                Text("Get Started")
                                    .font(Font.custom("Poppins-Light", size: 14 ))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(.white)
                                
                                .padding(.vertical, 15)
                                Spacer()
                            }
                            .background(Color("teal"))
                            .cornerRadius(10)
                            


                        }).padding(.bottom, 20)
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                withAnimation{
                                    viewRouter.currentPage = .page2
                                }
                            }, label: {
                                Text("Login Here")
                                    .font(Font.custom("Poppins-Light", size: 13 ))
                                    .multilineTextAlignment(.leading)
                                    .foregroundColor(Color("teal"))
                                  
                                
                            })

                        }
                        
                    }.padding(.horizontal, 30)
                    }
                    else{
                        
                             HStack{
                                 Button(action: {
                                    
                                         let index = 2
                                         offset = CGFloat(index) * screenSize.width
                                     
                                    
                                 }, label: {
                                     Text("Skip >>")
                                         .font(Font.custom("Poppins-Light", size: 14 ))
                                         .multilineTextAlignment(.leading)
                                         .foregroundColor(Color("walkthrough"))
                                 })
                                 
                                 Spacer()
                                 
                                 Button(action: {
                                    
                                         let index = min(getIndex() + 1, carousel.count - 1)
                                         offset = CGFloat(index) * screenSize.width
                                     
                                 }, label: {
                                     HStack{
                                         Text("Next")
                                             .font(Font.custom("Poppins-Light", size: 14 ))
                                             .multilineTextAlignment(.leading)
                                             .foregroundColor(Color("walkthrough"))
                                         Image(systemName: "arrow.right")
                                             .font(Font.custom("Poppins-Light", size: 10 ))
                                             .foregroundColor(Color("walkthrough"))
                                             .padding(.leading, -5)
                                         
                                     }
                                 })
                             }.padding(.horizontal, 30)
                    }
            }
                .frame(width: screenSize.width, height: screenSize.height/8)
                .background(Color.white)
            
            

            
        }
        .background(Color.white)
        .animation(.easeInOut, value: getIndex())
       
       
    }
    func getIndicatorOffset() ->CGFloat{
        let progress = offset / screenSize.width
        let maxWidth: CGFloat = 9 + 7
        return progress * maxWidth
    }
    func getIndex() -> Int{
        let progress = round(offset / screenSize.width)
        
        let index = min(Int(progress), carousel.count + 1)
        return index
        
    }

}

struct Walkthrough_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter(), selected: SelectedIcon())
    }
}
