//
//  RehberView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 18.02.2026.
//
import SwiftUI

struct RehberView: View{
    @Binding var selectedTab: Int
    @State private var searchText=""
    
    var body: some View{
        NavigationStack{
            ZStack{
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                VStack(spacing: 20){
                    Image("kou_logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .padding(.top, 40)
                    
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Ad, Soyad, Birim Adı veya Rakam Yazınız", text: $searchText)
                            .font(.system(size:14))
                    }
                    
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                    
                    
                    HStack{
                        Text("En az 5 karakter girmeniz gerekmektedir")
                        
                            .font(.caption)
                            .foregroundColor(.gray)
                            .padding(.top, 10)
                            .padding(.leading, 5)
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                }
            }
            .navigationTitle("Rehber")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.white, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button(action: {
                        selectedTab = 0
                    }){
                        HStack(spacing: 3){
                            Image(systemName: "arrow.left")
                            Text("Geri")
                        }
                        .foregroundColor(.black)
                        .font(.system(size: 16, weight: .medium))
                    }
                }
            }
            
        }
    }
}
