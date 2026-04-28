//
//  StudentProfileView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 24.03.2026.
//

import SwiftUI

struct StudentProfileView: View{
    @Binding var isLoggedIn: Bool
    @State private var showNotDurumu = false
    @State private var showDersProgrami = false
    @State private var showMessages = false
    
    let colums = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View{
        VStack(alignment: .leading, spacing: 24){
            HStack{
                Spacer()
                Button(action:{
                    
                }){
                    Image(systemName: "xmark")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                }
            }
            .padding(.horizontal)
            
            HStack(spacing: 16){
                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width:80, height: 80)
                    .foregroundColor(.gray.opacity(0.5))
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.green, lineWidth: 2)
                    )
                VStack(alignment: .leading, spacing: 4){
                    Text("Bilal Zeyd \nKılıç")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    
                    Text("123456789")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            LazyVGrid(columns: colums, spacing: 16){
                MenuCardView(title: "Not Durumu", iconName:"doc.text.magnifyingglass", isActive: true) { showNotDurumu = true}
                MenuCardView(title: "Ders Programı", iconName:"calendar", isActive: true) { showDersProgrami = true }
                MenuCardView(title: "Mesajlar", iconName:"paperplane", isActive: true) { showMessages = true }
                
                //Aktif Olmayanlar şuanlık
                MenuCardView(title: "Sınav Programı", iconName:"calendar.badge.clock", isActive: false)
                MenuCardView(title: "ÖBS Duyurular", iconName:"megaphone", isActive: true)
                MenuCardView(title: "Bölüm Duyuruları", iconName:"megaphone.fill", isActive: false)
                MenuCardView(title: "Bölüm Etkinlikleri", iconName:"laptopcomputer", isActive: false)
                MenuCardView(title: "Okul Kulüpleri", iconName:"person.3", isActive: false)
            }
            .padding(.horizontal)
            
            Spacer()
            
            Button(action: {
                
            }) {
                HStack(spacing: 8){
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                        .font(.title3)
                    Text("Çıkış Yap")
                        .font(.headline)
                }
                .foregroundColor(.green)
            }
            .padding(.horizontal)
            .padding(.bottom, 30)
        }
        .fullScreenCover(isPresented: $showNotDurumu){
            NotDurumuView()
        }
        .fullScreenCover(isPresented: $showDersProgrami){
            DersProgramiView()
        }
        .fullScreenCover(isPresented: $showMessages){
            MessagesListView()
        }
    }
    struct MenuCardView: View{
        var title: String
        var iconName: String
        var isActive: Bool
        var action: () -> Void = {}
        
        var body: some View {
            Button(action: {
                if isActive {
                   action()
                }
            }) {
                VStack(alignment: .leading, spacing: 12){
                    Image(systemName: iconName)
                        .font(.system(size: 24))
                        .foregroundColor(isActive ? .green : .gray.opacity(0.5))
                    
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(isActive ? .primary : .gray.opacity(0.5))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Color.gray.opacity(0.08))
                .cornerRadius(12)
            }
            .disabled(!isActive)
        }
    }
}
