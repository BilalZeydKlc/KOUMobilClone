//
//  LoginView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 18.02.2026.
//
import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool
    @Binding var isAkademisyenLoggedIn: Bool
    @State private var selectedTab = 0
    
    @State private var studentID: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false
    
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
                VStack(alignment: .leading, spacing: 8){
                    Text(selectedTab == 0 ? "Öğrenci No" : "Sicil No")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .fontWeight(.medium)
                    
                    TextField(selectedTab == 0 ? "Öğrenci Numaranızı Giriniz" : "Sicil Numaranızı Giriniz", text: $studentID)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:10).stroke(Color.gray.opacity(0.3)))
                        .keyboardType(.numberPad)
                }
                
                VStack(alignment: .leading, spacing: 8){
                    Text("Şifre")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .fontWeight(.medium)
                    
                    SecureField("Şifrenizi Giriniz", text: $password)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3)))
                }
                
                if showError{
                    Text("Hatalı Numara veya Şifre!")
                        .foregroundColor(.red)
                        .font(.caption)
                }
            }
            .padding(.top)
            
            Button(action: {
                if selectedTab == 0 {
                    if studentID == "123456789" && password == "123456"{
                        isLoggedIn = true
                        showError = false
                    } else {
                        showError = true
                    }
                } else if selectedTab == 1 {
                    if studentID == "12345" && password == "123"{
                        isAkademisyenLoggedIn = true
                        showError = false
                    } else {
                        showError = true
                    }
                }
            }){
                Text("Giriş Yap")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green.opacity(0.7))
            }
            .padding(.top, 10)
            Spacer()
        }
        .padding(30)
    }
}
