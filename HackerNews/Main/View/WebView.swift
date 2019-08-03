//
//  WebView.swift
//  HackerNews
//
//  Created by Mustafa Ozhan on 03/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI
import SafariServices

struct WebView: UIViewControllerRepresentable {
    
    let url: URL
    
    func makeUIViewController(context _: Context)
        -> SFSafariViewController {
            return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(
        _: SFSafariViewController,
        context _: Context
    ) {}
}
