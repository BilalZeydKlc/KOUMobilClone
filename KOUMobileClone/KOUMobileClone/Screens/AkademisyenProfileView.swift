//
//  AkademisyenProfileView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 7.04.2026.
//

import SwiftUI

struct AkademisyenProfileView: View {
    @Binding var isAkademisyenLoggedIn: Bool
    @Environment(\.dismiss) var dismiss
    
    @State private var showOgrencilerim = false
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            HStack {
                Spacer()
                Button(action: { dismiss() }) {
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 16) {
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.gray.opacity(0.5))
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.green, lineWidth: 2)
                    )
                VStack(alignment: .leading, spacing: 4) {
                    Text("Admin")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("Prof. Dr.")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: columns, spacing: 16) {
                AkademisyenMenuCard(title: "Öğrenci Listesi", iconName: "person.2.crop.square.stack") {
                    showOgrencilerim = true
                }
                AkademisyenMenuCard(title: "Mesajlar", iconName: "paperplane")
                AkademisyenMenuCard(title: "Takvimim", iconName: "calendar")
                AkademisyenMenuCard(title: "ÖBS Duyuruları", iconName: "megaphone")
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                isAkademisyenLoggedIn = false
                dismiss()
            }) {
                HStack(spacing: 8) {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.title3)
                    Text("Çıkış Yap")
                        .font(.headline)
                }
                .foregroundColor(.green)
            }
            .padding(.horizontal)
            
            Text("KOU Mobil Klon v1.0")
                .font(.caption)
                .foregroundColor(.gray)
                .padding(.horizontal)
                .padding(.bottom, 30)
        }
        .fullScreenCover(isPresented: $showOgrencilerim) {
            OgrencilerimView()
        }
    }
}

struct AkademisyenMenuCard: View {
    var title: String
    var iconName: String
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: action) { 
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: iconName)
                    .font(.title)
                    .foregroundColor(.green.opacity(0.6))
                
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .frame(height: 100)
            .background(Color(.systemGray6).opacity(0.5))
            .cornerRadius(12)
        }
    }
}
