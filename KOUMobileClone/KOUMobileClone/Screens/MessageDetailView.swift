//
//  MessageDetailView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 7.04.2026.
//

import SwiftUI

struct MessageDetailView: View{
    let message: Message
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        VStack(spacing: 0){
            HStack(alignment: .center, spacing: 15){
                Button(action: { dismiss() }){
                    Image(systemName: "arrow.left")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                
                VStack(alignment: .leading, spacing: 2){
                    Text(message.subject)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    Text(message.sender)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemBackground))
            
            ScrollView{
                HStack{
                    VStack(alignment: .leading, spacing: 15){
                        Text(message.body)
                            .font(.body)
                            .foregroundColor(.primary)
                            .lineSpacing(4)
                        
                        HStack{
                            Spacer()
                            Text(message.date)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(20)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.05), radius: 2)
                    
                    Spacer(minLength: 40)
                }
                .padding()
            }
            .background(Color(.systemGray6))
        }
        .navigationBarHidden(true)
    }
}
