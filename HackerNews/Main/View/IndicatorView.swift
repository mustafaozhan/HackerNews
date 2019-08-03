//
//  ActivityIndicatorView.swift
//  HackerNews
//
//  Created by Mustafa Ozhan on 25/07/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI

struct IndicatorView: View {
    let style: UIActivityIndicatorView.Style
    let color: UIColor
    @State private var size = CGSize.zero
    
    var body: some View {
        GeometryReader { geometry in
            InnerView(
                style: self.style,
                color: self.color,
                parentSize: geometry.size,
                size: self.$size
            )
        }.frame(height: size.height)
    }
    
    struct InnerView: UIViewRepresentable {
        let style: UIActivityIndicatorView.Style
        let color: UIColor
        let parentSize: CGSize
        @Binding var size: CGSize
        
        func makeUIView(context _: Context) -> UIActivityIndicatorView {
            let uiView = UIActivityIndicatorView(style: style)
            uiView.color = color
            uiView.startAnimating()
            return uiView
        }
        
        func updateUIView(
            _ uiView: UIActivityIndicatorView,
            context _: Context
        ) {
            DispatchQueue.main.async {
                self.size = uiView.sizeThatFits(self.parentSize)
            }
        }
    }
}

#if DEBUG
struct IndicatorViewPreviews: PreviewProvider {
    
    static var previews: some View {
        IndicatorView(
            style: .medium,
            color: UIColor(named: "Primary")!
        )
    }
}
#endif
