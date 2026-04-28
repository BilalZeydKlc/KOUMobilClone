//
//  OgrenciDetayView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 13.04.2026.
//

import SwiftUI

struct OgrenciDetayView: View{
    @Environment(\.dismiss) var dismiss
    var ogrenci: Ogrenci
    @State private var isGenelBilgilerExpanded = false
    @State private var isEkBilgilerExpanded = false
    
    var body: some View{
        VStack(spacing: 0){
            HStack{
                Button(action: { dismiss() }){
                    HStack(spacing: 4){
                        Image(systemName: "arrow.left")
                        Text("Geri")
                    }
                    .foregroundColor(.primary)
                }
                Spacer()
                Text("Öğrenci Detay").font(.headline).fontWeight(.bold)
                Spacer()
                Text("Geri").foregroundColor(.clear).padding(.leading, 15)
            }
            .padding()
            .background(Color(.systemBackground))
            
            ScrollView{
                VStack(spacing: 20){
                    HStack(spacing: 16){
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color(.systemGray5))
                            .frame(width: 70, height: 75)
                            .overlay(
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.gray.opacity(0.5))
                                    .padding(15)
                            )
                        VStack(alignment: .leading, spacing: 6){
                            Text(ogrenci.name.uppercased())
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                            
                            Text(ogrenci.studentNo)
                                .font(.subheadline)
                                .foregroundColor(.gray.opacity(0.8))
                        }
                        Spacer()
                    }
                    .padding(16)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
                    
                    HStack(spacing: 16){
                        VStack(spacing: 8){
                            Text("AGNO")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            Text("3.03")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.13, green: 0.55, blue: 0.27))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,20)
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
                        
                        VStack(spacing: 8){
                            Text("Mezun Ort.")
                                .font(.subheadline)
                                .foregroundColor(.primary)
                            Text("3.46")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(Color(Color(red: 0.13, green: 0.55, blue: 0.27)))
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 20)
                        .background(Color(.systemBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
                    }
                    VStack(spacing: 12){
                        VStack(spacing: 0){
                            Button(action: {
                                withAnimation(.spring()){
                                    isGenelBilgilerExpanded.toggle()
                                }
                            }){
                                HStack{
                                    Text("Genel Bilgiler")
                                        .font(.body)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    Image(systemName: isGenelBilgilerExpanded ? "chevron.down" : "chevron.right")
                                        .foregroundColor(.primary)
                                        .font(.subheadline)
                                        .fontWeight(.semibold)
                                }
                                .padding()
                                .background(Color(.systemBackground))
                            }
                            if isGenelBilgilerExpanded{
                                VStack(spacing: 16){
                                    InfoRow(title: "Bölüm", value: "Bilgisayar\nMühendisliği")
                                    InfoRow(title: "Sınıf", value: "Y.Lisans Tez")
                                    InfoRow(title: "Durum", value: "Devamlı")
                                    InfoRow(title: "Danışman ID", value: "1993")
                                }
                                .padding(.horizontal)
                                .padding(.bottom, 16)
                                .background(Color(.systemBackground))
                            }
                        }
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
                        
                        VStack(spacing: 0){
                            Button(action: {
                                withAnimation(.spring()){
                                    isEkBilgilerExpanded.toggle()
                                }
                            }){
                                Text("Ek Bilgiler")
                                    .font(.body)
                                    .foregroundColor(.primary)
                                Spacer()
                                Image(systemName: isEkBilgilerExpanded ? "chevron.down" : "chevron.right")
                                    .foregroundColor(.primary)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            .padding()
                        }
                        if isEkBilgilerExpanded{
                            VStack(spacing: 16){
                                InfoRow(title: "Giriş Türü", value: "Bilinmiyor")
                                InfoRow(title: "Diploma Türü", value: "Bilinmiyor")
                                InfoRow(title: "Fakülte", value: "Bilinmiyor")
                            }
                            .padding(.horizontal)
                            .padding(.bottom, 20)
                        }
                    }
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
                }
                .padding()
            }
            .background(Color(.systemGray6))
        }
        .navigationBarHidden(true)
    }
}

struct DetayMenuButonu: View{
    var title: String
    var action: () -> Void
    
    var body: some View{
        Button(action: action){
            HStack{
                Text(title)
                    .font(.body)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.primary)
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
        }
    }
}

struct InfoRow: View{
    var title: String
    var value: String
    
    var body: some View{
        HStack(alignment: .top){
            Text(title)
                .frame(width: 110, alignment: .leading)
                .foregroundColor(.primary)
            
            Text(value)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
