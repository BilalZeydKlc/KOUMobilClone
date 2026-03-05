//
//  HomeView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 17.02.2026.
//
import SwiftUI
struct HomeView: View{
    @Binding var selecedTab: Int
    @State private var isShowingLogin = false
    var body: some View{
        NavigationStack{
            ScrollView{
                VStack(spacing: 20){
                    HomeHeader()
                    StoryCarousel()
                    NewsSection()
                    QuickMenuGrid(selectedTab: $selecedTab)
                    BottomTabSection(isLoginModalOpen: $isShowingLogin)
                }
                .padding(.bottom, 100)
                
                .sheet(isPresented: $isShowingLogin){
                    LoginView()
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            }
            .background(Color.bgGray)
        }
    }
}
