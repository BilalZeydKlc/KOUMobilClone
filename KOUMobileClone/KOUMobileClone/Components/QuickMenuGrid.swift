//
//  QuickMenuGrid.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 17.02.2026.
//
import SwiftUI

struct QuickMenuGrid: View{
    @Binding var selectedTab: Int
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View{
        VStack(alignment: .leading){
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    menuItem(icon: "doc.text", title: "Yemek\nMenüsü", color: .green)
                    menuItem(icon: "book", title: "ÖBS", color: .blue)
                    menuItem(icon: "envelope" , title: "E-posta", color: .orange)
                    menuItem(icon: "lifepreserver" , title: "E-Destek", color: .orange)
                    menuItem(icon: "plus" , title: "Tümü", color: .gray)
                        .onTapGesture{
                            selectedTab = 2
                        }
                }
                .padding(.horizontal)
            }
        }
    }
    func menuItem(icon: String, title: String, color: Color) -> some View{
        VStack(spacing: 12){
            Image(systemName: icon)
                .font(.title)
                .foregroundColor(color)
            
            Text(title)
                .font(.caption)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
        }
        .frame(width:110, height: 110)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}


