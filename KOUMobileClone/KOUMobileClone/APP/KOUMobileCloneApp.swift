//
//  KOUMobileCloneApp.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 16.02.2026.
//
import SwiftUI

@main
struct KOUMobileCloneApp: App {
    @State private var selectedTab = 0
    @State private var isLoginOpen = false
    @State private var isAkademisyenLoggedIn = false
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .bottom){
            TabView (selection: $selectedTab){
                
                HomeView(selecedTab: $selectedTab)
                    .tag(0)
                
                Text("Yerleşke Haritası")
                    .tag(1)
                    .toolbar(.hidden, for: .tabBar)
                
                InteraktifView()
                    .tag(2)
                    .toolbar(.hidden, for: .tabBar)
                
                RehberView(selectedTab: $selectedTab)
                    .tag(3)
                    
                Text("")
                    .tag(4)
                    .toolbar(.hidden, for: .tabBar)
            }
            CustomTabBar(selectedTab: $selectedTab, isLoginOpen: $isLoginOpen)
        }
            .sheet(isPresented: $isLoginOpen){
                if isLoggedIn{
                    StudentProfileView(isLoggedIn: $isLoggedIn)
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible)
                }else if isAkademisyenLoggedIn {
                    AkademisyenProfileView(isAkademisyenLoggedIn: $isAkademisyenLoggedIn)
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible)
                }else{
                    LoginView(isLoggedIn: $isLoggedIn, isAkademisyenLoggedIn: $isAkademisyenLoggedIn)
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}
