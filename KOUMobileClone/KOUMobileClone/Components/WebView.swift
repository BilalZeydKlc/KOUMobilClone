//
//  WebView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 9.03.2026.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView{
        return WKWebView()
    }
    
    func updateUIView(_ webView: WKWebView, context: Context){
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
