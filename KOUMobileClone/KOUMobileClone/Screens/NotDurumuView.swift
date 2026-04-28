//
//  NotDurumuView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 31.03.2026.
//

import SwiftUI

struct CourseGrade: Identifiable{
    let id = UUID()
    let name: String
    let akts: String
    let vize: String
    let final: String
    let but: String
    let letter: String
}

struct NotDurumuView: View{
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab = 0
    
    let mockGrandes = [
        CourseGrade(name: "Yapay Zeka", akts: "4", vize: "0", final: "0", but:"-", letter: "KK"),
        CourseGrade(name: "Bitirme Çalışması", akts: "4", vize: "0", final: "0", but:"-", letter: "KK"),
        CourseGrade(name: "Proje Yönetimi", akts: "4", vize: "0", final: "0", but:"-", letter: "KK"),
        CourseGrade(name: "Programlama Temelleri", akts: "4", vize: "0", final: "0", but:"-", letter: "KK"),
        CourseGrade(name: "MATEMATİK 1", akts: "4", vize: "0", final: "0", but:"-", letter: "KK")
    ]
    var body: some View{
        VStack(spacing: 0){
            HStack{
                Button(action:{
                    dismiss()
                }){
                    HStack(spacing: 4){
                        Image(systemName: "arrow.left")
                            .fontWeight(.medium)
                        Text("Geri")
                            .fontWeight(.medium)
                    }
                    .foregroundColor(.primary)
                }
                Spacer()
                
                Text("Not Durumu")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Spacer()
                Text("Geri").foregroundColor(.clear).padding(.leading, 15)
            }
            .padding()
            .background(Color(.systemBackground))
            
            HStack(spacing: 0){
                VStack{
                    Text("Yarıyıl")
                        .foregroundColor(selectedTab == 0 ? .green : .gray)
                        .fontWeight(selectedTab == 0 ? .semibold : .regular)
                    Rectangle()
                        .fill(selectedTab == 0 ? Color.green : Color.clear)
                        .frame(height: 2)
                        .padding(.top, 8)
                }
                .onTapGesture { selectedTab = 0 }
                VStack{
                    Text("Genel")
                        .foregroundColor(selectedTab == 1 ? .green : .gray)
                        .fontWeight(selectedTab == 1 ? .semibold : .regular)
                    Rectangle()
                        .fill(selectedTab == 1 ? Color.green : Color.clear)
                        .frame(height: 2)
                        .padding(.top, 8)
                }
                .onTapGesture { selectedTab = 1 }
            }
            .padding(.top, 10)
            .background(Color(.systemBackground))
            
            if selectedTab == 0 {
                
            ScrollView{
                VStack(spacing: 20){
                    VStack(spacing: -5){
                        Text("0.00")
                            .font(.system(size: 60, weight: .bold))
                            .foregroundColor(.green)
                        Text("Ortalama")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    
                    ForEach(mockGrandes){ course in GradeCardView (course: course) }
                }
                .padding(.horizontal)
                .padding(.bottom, 30)
            }
            .background(Color(.systemGray6))
        }
            else{
                GenelNotDurumuView()
            }
        }
        .navigationBarHidden(true)
    }
}

struct GradeCardView: View{
    var course: CourseGrade
    
    var body: some View{
        HStack{
            VStack(alignment: .leading, spacing: 16){
                Text(course.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                HStack(spacing: 24) {
                    ScoreColumnView(title: "AKTS", value: course.akts)
                    ScoreColumnView(title: "Vize", value: course.vize)
                    ScoreColumnView(title: "Final", value: course.final)
                    ScoreColumnView(title: "Büt", value: course.but)
                }
            }
            Spacer()
            
            Divider()
                .frame(height: 50)
                .padding(.horizontal, 5)
            
            Text(course.letter)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(.green)
                .frame(width: 60, alignment: .center)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct ScoreColumnView: View {
    var title: String
    var value: String
    
    var body: some View{
        VStack(spacing: 6){
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(.primary)
        }
    }
}
