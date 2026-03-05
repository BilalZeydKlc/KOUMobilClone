//
//  LoginView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 18.02.2026.
//
import SwiftUI

struct LoginView: View {
    @State private var selectedTab = 0
    func tabButton(title: String, index: Int)-> some View{
        Button(action: { selectedTab = index }){
            VStack{
                Text(title)
                    .foregroundColor(selectedTab == index ? .green : .gray)
                    .fontWeight(.medium)
                
                    Rectangle()
                    .fill(selectedTab == index ? Color.green : Color.clear)
                    .frame(height: 2)
            }
        }
        .frame(maxWidth: .infinity)
    }
    
    var body: some View {
        VStack(spacing: 25){
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 40, height: 5)
                .padding(.top, 10)
            
            Text("Giriş Yap")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack(spacing: 0){
                tabButton(title: "Öğrenci", index: 0)
                tabButton(title: "Akademisyen", index: 1)
            }
            .overlay(Divider().offset(y: 20), alignment: .bottom)
            
            VStack(spacing: 20){
                inputField(title: selectedTab == 0 ? "Öğrenci No" : "Sicil No", placeholder: selectedTab == 0 ?"Öğrenci Numaranızı Giriniz" : "Sicil Numaranızı Giriniz")
                
                inputField(title: "Şifre", placeholder: "Şifrenizi Giriniz")
            }
            .padding(.top)
            
            Button(action: {}){
                Text("Giriş Yap")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.7))
                    .cornerRadius(12)
            }
            .padding(.top, 10)
            Spacer()
        }
        .padding(30)
    }
}


func inputField(title: String, placeholder: String) -> some View{
    VStack(alignment: .leading, spacing: 8){
        Text(title)
            .font(.subheadline)
            .foregroundColor(.green)
            .fontWeight(.medium)
        
        TextField(placeholder, text: .constant(""))
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
    }
}
#Preview {
    LoginView()
}
 
