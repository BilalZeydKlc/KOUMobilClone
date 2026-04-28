//
//  GenelNotDurumuView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 28.04.2026.
//

import SwiftUI

struct GenelDers: Identifiable {
    let id = UUID()
    let ad: String
    let akts: Int
    let harfNotu: String
}

struct GenelNotDurumuView: View{
    let birinciYariyil = [
        GenelDers(ad: "Programlama Dilleri ve Presipleri", akts: 8, harfNotu: "AA"),
        GenelDers(ad: "Bilgisayar Organizasyonu ve Mimarisi", akts: 8, harfNotu: "AA"),
        GenelDers(ad: "Fizik II", akts: 8, harfNotu: "AA"),
        GenelDers(ad: "Matematik I", akts: 8, harfNotu: "AA")
    ]
    let ikinciYariyil = [
            GenelDers(ad: "Nesne Yönelimli Programlama", akts: 6, harfNotu: "BA"),
            GenelDers(ad: "Veri Yapıları", akts: 6, harfNotu: "AA"),
            GenelDers(ad: "Lineer Cebir", akts: 5, harfNotu: "CB"),
            GenelDers(ad: "İngilizce II", akts: 3, harfNotu: "AA")
        ]
        
        let ucuncuYariyil = [
            GenelDers(ad: "Algoritma Analizi", akts: 6, harfNotu: "BB"),
            GenelDers(ad: "Veritabanı Yönetim Sistemleri", akts: 6, harfNotu: "BA"),
            GenelDers(ad: "İşletim Sistemleri", akts: 6, harfNotu: "CB"),
            GenelDers(ad: "Olasılık ve İstatistik", akts: 5, harfNotu: "CC")
        ]
        
        let dorduncuYariyil = [
            GenelDers(ad: "Yazılım Mühendisliği", akts: 6, harfNotu: "AA"),
            GenelDers(ad: "Mobil Uygulama Geliştirme", akts: 6, harfNotu: "AA"),
            GenelDers(ad: "Bilgisayar Ağları", akts: 5, harfNotu: "BA"),
            GenelDers(ad: "Web Teknolojileri", akts: 5, harfNotu: "BB")
        ]
        
        let besinciYariyil = [
            GenelDers(ad: "Yapay Zeka", akts: 6, harfNotu: "BA"),
            GenelDers(ad: "Makine Öğrenmesi", akts: 6, harfNotu: "BB"),
            GenelDers(ad: "İnsan Bilgisayar Etkileşimi", akts: 5, harfNotu: "AA"),
            GenelDers(ad: "Mesleki Yabancı Dil", akts: 4, harfNotu: "BA")
        ]
        
        let altinciYariyil = [
            GenelDers(ad: "Görüntü İşleme", akts: 6, harfNotu: "CB"),
            GenelDers(ad: "Proje Yönetimi", akts: 5, harfNotu: "AA"),
            GenelDers(ad: "Siber Güvenlik Temelleri", akts: 5, harfNotu: "BA"),
            GenelDers(ad: "Gömülü Sistemler", akts: 6, harfNotu: "BB")
        ]
        
        let yedinciYariyil = [
            GenelDers(ad: "Yazılım Mimarisi", akts: 6, harfNotu: "BA"),
            GenelDers(ad: "Dağıtık Sistemler", akts: 6, harfNotu: "BB"),
            GenelDers(ad: "İş Yeri Eğitimi", akts: 10, harfNotu: "AA")
        ]
        
        let sekizinciYariyil = [
            GenelDers(ad: "Bitirme Projesi", akts: 10, harfNotu: "AA"),
            GenelDers(ad: "İş Yeri Uygulaması", akts: 10, harfNotu: "AA")
        ]
    var body: some View{
        VStack(spacing: 20){
            VStack(spacing: 4){
                Text("2.04")
                    .font(.system(size: 64, weight: .bold))
                    .foregroundColor(Color(red: 0.13, green: 0.55, blue: 0.27))
                
                Text("AGNO")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            .padding(.top, 20)
            
            ScrollView{
                VStack(spacing: 12){
                    YariyilAkordeonView(yariyilAd: "1.Yarıyıl", dersler: birinciYariyil, ortalama: "3.05")
                    YariyilAkordeonView(yariyilAd: "2.Yarıyıl", dersler: ikinciYariyil, ortalama: "2.70")
                    YariyilAkordeonView(yariyilAd: "3.Yarıyıl", dersler: ucuncuYariyil, ortalama: "3.40")
                    YariyilAkordeonView(yariyilAd: "4.Yarıyıl", dersler: dorduncuYariyil, ortalama: "3.08")
                    YariyilAkordeonView(yariyilAd: "5.Yarıyıl", dersler: besinciYariyil, ortalama: "3.75")
                    YariyilAkordeonView(yariyilAd: "6.Yarıyıl", dersler: altinciYariyil, ortalama: "2.90")
                    YariyilAkordeonView(yariyilAd: "7.Yarıyıl", dersler: yedinciYariyil, ortalama: "4.00")
                    YariyilAkordeonView(yariyilAd: "8.Yarıyıl", dersler: sekizinciYariyil, ortalama: "3.25")
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
        }
        .background(Color(.systemGray6).ignoresSafeArea())
    }
}

struct YariyilAkordeonView: View{
    var yariyilAd: String
    var dersler: [GenelDers]
    var ortalama: String
    
    @State private var isExpanded = false
    
    var body: some View{
        VStack(spacing: 0){
            Button(action:{
                withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                    isExpanded.toggle()
                }
            }){
                HStack{
                    Text(yariyilAd)
                        .font(.body)
                        .foregroundColor(.primary)
                        .fontWeight(isExpanded ? .bold : .regular)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundColor(.primary)
                        .font(.headline)
                }
                .padding()
                .background(Color(.systemBackground))
            }
            
            if isExpanded{
                VStack(spacing: 16){
                    if dersler.isEmpty{
                        Text("Bu Yarıyıla Ait Ders Bulunamadı.")
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.bottom, 10)
                    } else {
                        ForEach(dersler) { ders in
                            HStack(alignment: .top){
                                Text(ders.ad)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.primary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Text("\(ders.akts) AKTS")
                                    .font(.subheadline)
                                    .foregroundColor(.primary)
                                    .frame(width: 60, alignment: .trailing)
                                
                                Text(ders.harfNotu)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(.primary)
                                    .frame(width: 30, alignment: .trailing)
                            }
                        }
                        HStack{
                            Spacer()
                            Text("Ortalama: \(ortalama)")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.primary)
                        }
                        .padding(.top, 8)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom, 16)
                .background(Color(.systemBackground))
            }
        }
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
    }
}
