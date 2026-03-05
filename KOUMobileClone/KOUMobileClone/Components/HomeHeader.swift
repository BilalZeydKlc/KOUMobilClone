
//
//  HomeHeader.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 17.02.2026.
//
import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack {
            
            HStack(spacing: 10) {
                Image("kou_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 45, height: 45)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("KOCAELİ ÜNİVERSİTESİ")
                        .font(.system(size: 14, weight: .bold))
                    
                    Text("ADAY ARAŞTIRMA ÜNİVERSİTESİ")
                        .font(.system(size: 8))
                        .foregroundColor(.blue)
                }
            }
            
            Spacer()
            
            NavigationLink(destination: NotificationsView()){
                Image(systemName: "bell")
                    .font(.title3)
                    .font(.system(size: 24))
                    .padding(8)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.1), radius: 2)
            }
            
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}
