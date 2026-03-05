//
//  AnnouncementsSection.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 24.02.2026.
//
import SwiftUI

struct AnnouncementItem: Identifiable{
    let id = UUID()
    let day: String
    let month: String
    let title: String
}

struct AnnouncementsSection: View{
    let mockDuyurular: [AnnouncementItem] = [
        AnnouncementItem(day: "24", month: "ŞUB", title: "HAYDİ ÖĞRENCİLER TİYATROYA"),
        AnnouncementItem(day: "23", month: "ŞUB", title: "07.11.2025-21.11.2025 tarihli Sözleşmeli Personel Alımı İlanı Sonuçları (Yedek Listeden Çağrılan Adaylar)"),
        AnnouncementItem(day: "23", month: "ŞUB", title: "HAYDİ ÖĞRENCİLER MAÇA"),
        AnnouncementItem(day: "21", month: "ŞUB", title: "16. ULUSLARARASI MARMARA FEN VE SOSYAL BİLİMLER KONGRESİ"),
    ]
    
    var body: some View{
        VStack(spacing: 12){
            ForEach(mockDuyurular){ duyuru in
                
                HStack(spacing: 15){
                    VStack(spacing: -2){
                        Text(duyuru.day)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray.opacity(0.5))
                        
                        Text(duyuru.month)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    .frame(width: 50)
                    Text(duyuru.title)
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                    .shadow(color: .black.opacity(0.05), radius: 3, x: 0, y: 2)
            }
            Button(action:{
                print("Tüm Duyurulara Tıklandı")
            }){
                Text("Tüm Duyurular")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.green)
                    .underline()
            }
            .padding(.top, 10)
        }
        .padding(.horizontal)
    }
}
