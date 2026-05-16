//
//  AkademisyenMesajlarView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 16.05.2026.
//

import SwiftUI

struct AkademisyenMesaj: Identifiable {
    let id = UUID()
    let konu: String
    let gonderen: String
}

struct AkademisyenMesajlarView: View {
    @Environment(\.dismiss) var dismiss
    @State private var aramaMetni = ""
    
    let mesajlar = [
        AkademisyenMesaj(konu: "Bugünkü Ders Hakkında", gonderen: "Bilal Zeyd"),
        AkademisyenMesaj(konu: "Ertelenen Ders Hakkında", gonderen: "Ali")
    ]
    
    var body: some View {
        // KÖPRÜLERİN ÇALIŞMASI İÇİN NAVIGATIONSTACK EKLENDİ
        NavigationStack {
            VStack(spacing: 0) {
                
                // --- ÜST BAR ---
                HStack {
                    Button(action: { dismiss() }) {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.left")
                                .fontWeight(.medium)
                            Text("Geri")
                                .fontWeight(.medium)
                        }
                        .foregroundColor(.primary)
                    }
                    Spacer()
                    Text("Mesajlar")
                        .font(.headline)
                        .fontWeight(.bold)
                    Spacer()
                    Text("Geri").foregroundColor(.clear).padding(.leading, 15)
                }
                .padding()
                .background(Color(.systemBackground))
                
                // --- ARAMA ÇUBUĞU ---
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Mesajlarda Arayın...", text: $aramaMetni)
                        .font(.subheadline)
                }
                .padding(12)
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal)
                .padding(.bottom, 10)
                .background(Color(.systemBackground))
                
                // --- MESAJ LİSTESİ ---
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(mesajlar) { mesaj in
                            // HEDEF "DETAY" EKRANI OLARAK DÜZELTİLDİ
                            NavigationLink(destination: AkademisyenMesajDetayView()) {
                                HStack {
                                    VStack(alignment: .leading, spacing: 6) {
                                        Text(mesaj.konu)
                                            .font(.headline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.primary)
                                        
                                        Text(mesaj.gonderen)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()
                                    Image(systemName: "folder")
                                        .font(.title2)
                                        .foregroundColor(Color(red: 0.13, green: 0.55, blue: 0.27))
                                }
                                .padding()
                                .background(Color(.systemBackground))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
                            }
                            .buttonStyle(PlainButtonStyle()) // Buton stili eklendi
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 30)
                }
                .background(Color(.systemGray6))
            }
            .navigationBarHidden(true)
        }
    }
}
