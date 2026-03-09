//
//  IcTarayiciView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 9.03.2026.
//

import SwiftUI

struct IcTarayiciView: View{
    let title: String
    let urlString: String
    @Environment(\.presentationMode) var presentationMode

    var body: some View{
        VStack(spacing: 0){
            HStack{
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }){
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                Spacer()
                VStack(spacing: 2){
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(urlString)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Button(action: {
                    
                }){
                    Image(systemName: "ellipsis")
                        .font(.title2)
                        .foregroundColor(.black)
                        .rotationEffect(.degrees(90))
                }
            }
            .padding()
            .background(Color.white)
            .shadow(color: Color.black.opacity(0.05), radius: 3, x: 0, y: 3)
            
            if let url = URL(string: urlString){
                WebView(url: url)
            }else{
                Text("Geçersiz URL")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
