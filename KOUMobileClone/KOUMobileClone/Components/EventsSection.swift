//
//  EventsSection.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 25.02.2026.
//
import SwiftUI


struct EventItem: Identifiable{
    let id = UUID()
    let day: String
    let month: String
    let title: String
}

struct EventsSection: View{
    let mocketkinlikler: [EventItem] = [
        EventItem(day: "08", month: "MAY", title: "16. Uluslararası Marmara Fen ve Sosyal Bilimler Kongresi (IMASCON 26 Spring)"),
        EventItem(day: "26", month: "NİS", title: "MENA EARTH"),
        EventItem(day: "25", month: "ŞUB", title: "Oku & Yayımla (Read & Publish Eğitimi)"),
        EventItem(day: "19", month: "ŞUB", title: "Oku & Yayımla (Read & Publish Eğitimi)")
    ]
    var body: some View{
        VStack(spacing: 12){
            
            ForEach(mocketkinlikler){ etkinlik in
                
                HStack(spacing: 15){
                    VStack(spacing: -2){
                        Text(etkinlik.day)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray.opacity(0.5))
                        
                        Text(etkinlik.month)
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray.opacity(0.5))
                    }
                    .frame(width: 50)
                    
                    Text(etkinlik.title)
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
                print("Tüm Etkinliklere Tıklandı")
            }){
                Text("Tüm Etkinlikler")
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
