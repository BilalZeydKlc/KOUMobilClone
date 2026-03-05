//
//  NewsSection.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 17.02.2026.
//
import SwiftUI

struct NewsItem: Identifiable{
    let id = UUID()
    let title: String
    let imageName: String
}
struct NewsSection: View{
    
    let mockHaberler: [NewsItem] = [
        NewsItem(title: "Rektörümüz, 'Binbir Gece Resimleri' Sergisine Katıldı", imageName: "image1"),
        NewsItem(title: "Sporun Şehri Kocaeli'de 2026 Vizyonu", imageName: "image2"),
        NewsItem(title: "Girişimciliğin İlk Durağı: Bilimpark Ön Kuluçka Merkezi", imageName: "image3"),
        NewsItem(title: "Bahar Şenlikleri Takvimi Açıklandı", imageName: "image4"),
        NewsItem(title: "KOU Teknopark'tan Yeni Girişimcilere Destek", imageName: "image5"),
        NewsItem(title: "Kocaeli Üniversitesi İlahiyat Fakültesi İftar Programında Gönülleri Bir Oldu", imageName: "image6"),
        NewsItem(title: "DETAB Kursu Tamamlandı", imageName: "image8"),
        NewsItem(title: "Çatışma Bölgelerinde Çocuk Hakları", imageName: "image7"),
        
        
    ]
    var body: some View{
        VStack(alignment: .leading, spacing: 10){
            HStack{
                Text("Son Haberler").font(.headline).bold()
                Spacer()
                NavigationLink(destination: NewsListView()){
                    Text("Tümü")
                        .foregroundColor(.gray)
                        .font(.caption)
                } 
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 15){
                   
                    ForEach(mockHaberler){ haber in
                        newsCard(imageName: haber.imageName, title: haber.title)
                        
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

func newsCard(imageName: String, title: String) -> some View{
    VStack(alignment: .leading,){
        Rectangle()
            .fill(Color.gray.opacity(0.3))
            .frame(width: 280, height: 160)
            .cornerRadius(12)
            .overlay(
                Image(imageName)
                    .resizable()
                    .scaledToFill()
            )
            .clipped()
        
            Text(title)
            .font(.subheadline)
            .fontWeight(.semibold)
            .lineLimit(2)
            .frame(width: 280, height: 45, alignment: .topLeading)
            .padding(.top, 5)
    }
    .frame(width: 280)
}
