//
//  BottomTabSeciton.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 17.02.2026.
//
import SwiftUI

struct BottomTabSection: View{
    @Binding var isLoginModalOpen: Bool
    @State private var selectedIndex = 0
    
    var body: some View{
        VStack(spacing: 0){
            HStack(spacing: 0){
                Button(action:{
                    withAnimation{ selectedIndex = 0}
                }){
                    VStack(spacing: 10){
                        HStack{
                            Image(systemName: "megaphone")
                            Text("Duyurular")
                        }
                        .foregroundColor(selectedIndex == 0 ? .green : .gray)
                        .font(.system(size: 15, weight: .bold))
                        
                        Rectangle()
                            .fill(selectedIndex == 0 ? .green : Color.clear)
                            .frame(height: 2)
                    }
                }
                Button(action: {
                    withAnimation { selectedIndex = 1}
                }){
                    VStack(spacing: 10){
                        HStack{
                            Image(systemName: "calendar")
                            Text("Etkinlikler")
                        }
                        .foregroundColor(selectedIndex == 1 ? .green : .gray)
                        .font(.system(size: 15, weight: .bold))
                        
                        Rectangle()
                            .fill(selectedIndex == 1 ? .green : Color.clear)
                            .frame(height: 2)
                    }
                }
            }
            .padding(.top, 10)
            .background(Color.white)
            
            ZStack(alignment: .top){
                if selectedIndex == 0{
                    AnnouncementsSection()
                        .padding(.top, 15)
                }else{
                    EventsSection()
                        .padding(.top, 15)
                }
            }
        }
    }
}

