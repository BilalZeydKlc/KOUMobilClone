//
//  InteraktifView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 18.02.2026.
//
import SwiftUI

struct InteraktifItem: Identifiable{
    let id = UUID()
    let title: String
    let subtitle: String
    let iconName: String
    let url: String
}
struct InteraktifView: View{
    @State private var searchText = ""
    @State private var isGridView = false
    @State private var showWebView = false
    @State private var webTitle = ""
    @State private var webURL = ""
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    let mockVeriler: [InteraktifItem] = [
        InteraktifItem(title: "AKTS Bilgi Paketi", subtitle: "AKTS Bilgi Paketi", iconName: "cylinder.split.1x2", url: "https://ects.kocaeli.edu.tr/"),
        InteraktifItem(title: "EBYS", subtitle: "Elektronik Belge Yönetim Sistemi", iconName: "doc.on.doc", url: "https://ebys.kocaeli.edu.tr/"),
        InteraktifItem(title: "Eposta (1.Alternatif)", subtitle: "Eposta (1.Alternatif)", iconName: "envelope", url:"https://webmail.kocaeli.edu.tr/"),
        InteraktifItem(title: "Eposta (2.Alternatif)", subtitle: "Eposta (2.Alternatif)", iconName: "envelope", url:"https://webmails.kocaeli.edu.tr/iwc_static/layout/login.html?lang=tr-TR&3.0.1.0.0_15051214&svcs=abs,mail,c11n"),
        InteraktifItem(title: "Öğrenci Eposta Talep Sistemi", subtitle: "Öğrenci Eposta Talep Sistemi", iconName: "person.text.rectangle", url:"https://portal.kocaeli.edu.tr/emailogr/"),
        InteraktifItem(title: "Personal Eposta Talep Sistemi", subtitle: "Personal Eposta Talep Sistemi", iconName: "person.crop.circle", url:"https://epostaislemleri.kocaeli.edu.tr/epostabasvuru/"),
        InteraktifItem(title: "Eposta Parola Yenileme", subtitle: "Eposta Parola Yenileme", iconName: "graduationcap.circle", url:"https://pys.kocaeli.edu.tr/passman/login.cfm"),
        InteraktifItem(title: "Bilgi Yönetim Sistemi", subtitle: "Bilsis", iconName: "person.crop.circle", url:"https://bilsis.kocaeli.edu.tr/"),
        InteraktifItem(title: "Pernet", subtitle: "Personel Programı Giriş", iconName: "graduationcap.fill", url:"https://pernet.kocaeli.edu.tr/"),
        InteraktifItem(title: "Application for Foreign Faculty Position", subtitle: "Application for Foreign Faculty Position", iconName: "person.crop.circle", url:"https://yabancibasvuru.kocaeli.edu.tr/"),
        InteraktifItem(title: "ÖBS Öğrenci Girişi", subtitle: "Öğrenci Bilgi Sistemi", iconName: "doc.on.doc", url:"https://ogr.kocaeli.edu.tr/koubs/ogrenci/index.cfm"),
        InteraktifItem(title: "ÖBS Akademik Giriş", subtitle: "Öğrenci Bilgi Sistemi", iconName: "doc.on.doc", url:"https://ogr.kocaeli.edu.tr/koubs/akapers/"),
        InteraktifItem(title: "ÖBS İdari Giriş", subtitle: "Öğrenci Bilgi Sistemi", iconName: "doc.on.doc", url:"https://ogr.kocaeli.edu.tr/KOUBS/idaripers/"),
        InteraktifItem(title: "ÖBS EYYK", subtitle: "Eğitimde Yeniden Yapılanma", iconName: "doc.on.doc", url:"https://ogr.kocaeli.edu.tr/koubs/bologna/"),
        InteraktifItem(title: "Telefon Rehberi", subtitle: "Telefon Rehberi", iconName: "doc.on.doc", url:"https://rehber.kocaeli.edu.tr/rehber2/login.cfm"),
        InteraktifItem(title: "Kalite Yönetim Bilgi Sistemi", subtitle: "Kalite Yönetim Bilgi Sistemi", iconName: "doc.on.doc", url:"https://koukybs.kocaeli.edu.tr/kalite"),
        InteraktifItem(title: "KYS - Talep Yönetim Sistemi", subtitle: "KYS - Talep Yönetim Sistemi", iconName: "doc.on.doc", url:"https://kys.kocaeli.edu.tr/"),
        InteraktifItem(title: "Araştırma Hastanesi", subtitle: "Kocaeli Üniversitesi Hastanesi", iconName: "doc.on.doc", url:"https://hastane.kocaeli.edu.tr/"),
        InteraktifItem(title: "Kütüphane", subtitle: "Kütüphane", iconName: "doc.on.doc", url:"https://kutuphane.kocaeli.edu.tr/"),
        InteraktifItem(title: "Akademik Personel B.B", subtitle: "Akademik Personel B.B", iconName: "doc.on.doc", url:"https://avesis.kocaeli.edu.tr/"),
    ]
    
    var body: some View{
        NavigationStack{
            ZStack{
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    HomeHeader()
                        .padding(.top, 10)
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .font(.system(size: 20))
                        
                        TextField("İnteraktiflerde arayın...", text: $searchText)
                            .foregroundColor(.black)
                        
                        Button(action:{
                            withAnimation(.easeInOut(duration: 0.3)){
                                isGridView.toggle()
                            }
                        }){
                            Image(systemName: isGridView ? "square.grid.2x2" : "list.bullet")
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: .black.opacity(0.05),radius: 2, x: 0, y: 1)
                    .padding(.horizontal, 20)
                    
                    ScrollView(showsIndicators: false){
                        if isGridView{
                            LazyVGrid(columns: columns, spacing: 15){
                                ForEach(mockVeriler){ item in
                                    gridCard(item: item)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 100)
                        }else{
                            VStack(spacing: 12){
                                ForEach(mockVeriler){item in
                                    listCard(item: item)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.bottom, 100)
                        }
                    }
                }
            }
            .toolbar(.hidden, for: .navigationBar)
            .sheet(isPresented: $showWebView){
                IcTarayiciView(title: webTitle, urlString: webURL)
            }
        }
    }
    func listCard(item: InteraktifItem) -> some View {
        Button(action: {
            webTitle = item.title
            webURL = item.url
            showWebView = true
        }){
            HStack(spacing: 15){
                Image(systemName: item.iconName)
                    .font(.system(size: 22))
                    .foregroundColor(.green.opacity(0.7))
                
                VStack(alignment: .leading, spacing: 4){
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    Text(item.subtitle)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "arrow.up.right")
                    .foregroundColor(.gray.opacity(0.4))
            }
            .padding()
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.03), radius: 2, x: 0, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
    func gridCard(item: InteraktifItem) -> some View {
        Button(action :{
            webTitle = item.title
            webURL = item.url
            showWebView = true
        }){
            HStack(spacing: 10){
                Image(systemName: item.iconName)
                    .font(.system(size: 18))
                    .foregroundColor(.green.opacity(0.7))
                
                VStack(alignment: .leading, spacing: 4){
                    Text(item.title)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .lineLimit(2)
                        .frame(height: 32, alignment: .topLeading)
                }
                Spacer(minLength: 0)
                
                Image(systemName: "arrow.up.right")
                    .font(.system(size: 12))
                    .foregroundColor(.gray.opacity(0.4))
            }
            .padding(10)
            .frame(height: 70)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.03), radius: 2, x: 0, y: 1)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
