//
//  NewsListView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 25.02.2026.
//
import SwiftUI

struct NewsDetailItem: Identifiable{
    let id = UUID()
    let title: String
    let imageName: String
}

struct NewsListView: View{
    let mockhaberler: [NewsDetailItem] = [
        NewsDetailItem(title: "Rektörümüz, 'Binbir Gece Resimleri' Sergisine Katıldı", imageName: "image1"),
        NewsDetailItem(title: "Sporun Şehri Kocaeli'de 2026 Vizyonu", imageName: "image2"),
        NewsDetailItem(title: "Girişimciliğin İlk Durağı: Bilimpark Ön Kuluçka Merkezi", imageName: "image3"),
        NewsDetailItem(title: "Bahar Şenlikleri Takvimi Açıklandı", imageName: "image4"),
        NewsDetailItem(title: "KOU Teknopark'tan Yeni Girişimcilere Destek", imageName: "image5"),
        NewsDetailItem(title: "Kocaeli Üniversitesi İlahiyat Fakültesi İftar Programında Gönülleri Bir Oldu", imageName: "image6"),
        NewsDetailItem(title: "DETAB Kursu Tamamlandı", imageName: "image8"),
        NewsDetailItem(title: "Çatışma Bölgelerinde Çocuk Hakları", imageName: "image7"),
    ]
    var body: some View{
        ScrollView{
            LazyVStack(spacing: 0){
                ForEach(mockhaberler){ haber in
                    VStack(spacing: 0){
                        HStack(alignment: .top, spacing: 15){
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 110, height: 75)
                                .cornerRadius(8)
                                .overlay(
                                    Image(haber.imageName)
                                        .resizable()
                                        .scaledToFill()
                                )
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            VStack(alignment: .leading, spacing: 8){
                                Text(haber.title)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .lineLimit(3)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            Spacer()
                        }
                        .padding(.vertical, 15)
                        .padding(.horizontal, 20)
                            
                        Divider()
                            .padding(.horizontal,20)
                    }
                }
            }
        }
        .navigationTitle("Haberler")
        .navigationBarTitleDisplayMode(.inline)
    }
}
