//
//  CustomTabBar.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 18.02.2026.
//
import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: Int
    @Binding var isLoginOpen: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            
            TabBarButton(icon: "house", text: "Keşfet", index: 0)
            TabBarButton(icon: "map", text: "Yerleşke", index: 1)
            Spacer()
                .frame(width: 60)
            TabBarButton(icon: "person.2", text: "Rehber", index: 3)
            
            Button(action: {
                isLoginOpen = true
            }) {
                VStack(spacing: 4) {
                    Image(systemName: "arrow.right.square")
                        .font(.system(size: 24))
                    
                    Text("Giriş Yap")
                        .font(.caption2)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                }
                .foregroundColor(.gray)
                .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 10)
        .padding(.bottom, 10)
        .frame(height: 80)
        .background(Color.white)
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
        
        .overlay(
            Button(action: {
                selectedTab = 2
            }) {
                
                VStack(spacing: 0) {
                    ZStack {
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                            .shadow(color: .black.opacity(0.2), radius: 6, x: 0, y: 4)
                        
                        Image("koukısım")
                            .resizable()
                            .scaledToFill()
                            .scaleEffect(1.75)
                            .offset(y: 3)
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }
                    .offset(y: -30)
                    
                    Text("İnteraktif")
                        .font(.caption2)
                        .foregroundColor(selectedTab == 2 ? .green : .gray)
                        .offset(y: -23)
                }
            }
            
            , alignment: .bottom
        )
        
        .frame(maxWidth: .infinity)
    }
    
    func TabBarButton(icon: String, text: String, index: Int) -> some View {
        Button(action: {
            selectedTab = index
        }) {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                
                Text(text)
                    .font(.caption2)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
            }
            .foregroundColor(selectedTab == index ? .green : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}

