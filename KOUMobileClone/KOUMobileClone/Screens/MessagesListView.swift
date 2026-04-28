//
//  MessagesListView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 7.04.2026.
//

import SwiftUI

struct MessagesListView: View{
    @Environment(\.dismiss) var dismiss
    @State private var searchText = ""
    
    var filteredMessages: [Message]{
        if searchText.isEmpty{
            return MockData.messages
        }else{
            return MockData.messages.filter { $0.subject.localizedCaseInsensitiveContains(searchText) || $0.sender.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View{
        NavigationStack{
            VStack(spacing: 0){
                HStack{
                    Button(action: { dismiss()} ){
                        HStack(spacing: 4){
                            Image(systemName: "arrow.left")
                                Text("Geri")
                        }
                        .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("Mesajlar").font(.headline).fontWeight(.bold)
                    Spacer()
                    Text("Geri").foregroundColor(.clear).padding(.leading, 15)
                }
                .padding()
                .background(Color(.systemBackground))
                
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Mesajlarda Arayın...", text: $searchText)
                }
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.vertical,8)
                .background(Color(.systemBackground))
                
                ScrollView{
                    VStack(spacing: 12){
                        ForEach(filteredMessages){ message in
                            NavigationLink(destination: MessageDetailView(message: message)){
                                HStack{
                                    VStack(alignment: .leading, spacing: 6){
                                        Text(message.subject)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                            .lineLimit(1)
                                        
                                        Text(message.sender)
                                            .font(.subheadline)
                                            .foregroundColor(.secondary)
                                    }
                                    Spacer()
                                    Image(systemName: "folder")
                                        .foregroundColor(.green)
                                        .font(.title3)
                                }
                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.05), radius: 2, y: 1)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                }
                .background(Color(.systemGray6))
            }
            .navigationBarHidden(true)
        }
    }
}
