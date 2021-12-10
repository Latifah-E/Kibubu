//
//  OffsetPagetabView.swift
//  Kibubu IOS
//
//  Created by Smartcodes on 25/11/2021.
//

import SwiftUI

struct OffsetPagetabView<Content: View>: UIViewRepresentable {
    
    var content: Content
    @Binding var offset: CGFloat
    
    func makeCoordinator() -> Coordinator {
        return OffsetPagetabView.Coordinator(parent: self)
    }
    
    
    init(offset: Binding<CGFloat>, @ViewBuilder content : @escaping () ->Content){
        self.content  = content()
        self._offset = offset
    }
    
    func makeUIView(context: Context) -> UIScrollView {
        let scrollview = UIScrollView()
        
        let hostview = UIHostingController(rootView: content)
        hostview.view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            hostview.view.topAnchor.constraint(equalTo: scrollview.topAnchor),
            hostview.view.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            hostview.view.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            hostview.view.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            
            hostview.view.heightAnchor.constraint(equalTo: scrollview.heightAnchor)
        ]
        
        scrollview.addSubview(hostview.view)
        scrollview.addConstraints(constraints)
        
        scrollview.isPagingEnabled = true
        scrollview.showsVerticalScrollIndicator = false
        scrollview.showsHorizontalScrollIndicator = false
        
        
        scrollview.delegate = context.coordinator
        return scrollview
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        let currentOffset = uiView.contentOffset.x
        
        if currentOffset != offset{
            print("updating")
            uiView.setContentOffset(CGPoint(x: offset, y: 0), animated: true)
        }
    }
    
    
    class Coordinator: NSObject, UIScrollViewDelegate{
        var parent: OffsetPagetabView
        init(parent: OffsetPagetabView){
            self.parent =  parent
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let offset = scrollView.contentOffset.x
            parent.offset = offset
        }
    }
    

}


