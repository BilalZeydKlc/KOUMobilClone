//
//  NotificationsView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 18.02.2026.
//
import SwiftUI

struct NotificationsView: View{
    var body: some View{
        ZStack{
            Color.white.ignoresSafeArea()
            
            VStack{
                Text("Şu Anda Gösterlicek Bir Bildirim Yok")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .navigationTitle("Bildirimler")
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview{
    NavigationStack{
        NotificationsView()
    }
}
