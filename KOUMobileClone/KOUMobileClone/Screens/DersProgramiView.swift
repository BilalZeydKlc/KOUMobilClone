//
//  DersProgramiView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 1.04.2026.
//

import SwiftUI

struct Lesson: Identifiable{
    let id = UUID()
    let timeStart: String
    let timeEnd: String
    let name: String
    let teacher: String
    let classroom: String
}

struct DersProgramiView: View{
    @Environment(\.dismiss) var dismiss
    @State private var selectedDay = "Sal"
    @State private var selectedLesson: Lesson? = nil
    
    let days = ["Sal", "Çar", "Per", "Cum", "Cmt"]
    
    let mockLessons = [
        Lesson(timeStart: "10.00", timeEnd: "11.00", name: "Yapay Zeka", teacher: "Doç Dr. ADMİN", classroom: "201"),
        Lesson(timeStart: "15.00", timeEnd: "16.00", name: "Proje Yönetimi", teacher: "Doç Dr. ADMİN", classroom: "201"),
        Lesson(timeStart: "16.00", timeEnd: "17.00", name: "Matematik 1", teacher: "Doç Dr. ADMİN", classroom: "201"),
        Lesson(timeStart: "18.00", timeEnd: "19.00", name: "Programlama Temelleri", teacher: "Doç Dr. ADMİN", classroom: "201")
        
    ]
    
    var body: some View{
        VStack(spacing: 0){
            HStack{
                Button(action:{ dismiss() }){
                    HStack(spacing: 4){
                        Image(systemName: "arrow.left")
                        Text("Geri")
                    }
                    .foregroundColor(.primary)
                }
                Spacer()
                Text("Ders Programı").font(.headline).fontWeight(.bold)
                Spacer()
                Text("Geri").foregroundColor(.clear).padding(.leading, 15)
            }
            .padding()
            .background(Color(.systemBackground))
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 15){
                    ForEach(days, id: \.self){ day in
                    Text(day)
                            .fontWeight(.semibold)
                            .padding(.vertical, 8)
                            .padding(.horizontal, 20)
                            .background(selectedDay == day ? Color.green : Color.clear)
                            .foregroundColor(selectedDay == day ? .white : .green)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.green, lineWidth: 1))
                            .onTapGesture { selectedDay = day }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
            .background(Color(.systemBackground))
            
            ScrollView{
                VStack(spacing: 0){
                    ForEach(mockLessons){ lesson in
                        HStack(alignment: .top, spacing: 0){
                            VStack(spacing: 4){
                                Text(lesson.timeStart).fontWeight(.bold)
                                Text(lesson.timeEnd).fontWeight(.bold)
                            }
                            .font(.system(size: 14))
                            .frame(width: 60)
                            
                            VStack(spacing: 0){
                                Circle()
                                        .fill(Color.gray.opacity(0.5))
                                        .frame(width: 10, height: 10)
                                Rectangle()
                                            .fill(Color.gray.opacity(0.3))
                                            .frame(width: 2)
                            }
                            .padding(.horizontal, 10)
                            
                            Button(action: {
                                selectedLesson = lesson
                                print("\(lesson.name) detayına gidiliyor...")
                            }){
                                VStack(alignment: .leading, spacing: 8){
                                    Text(lesson.name)
                                        .font(.headline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.primary)
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(lesson.teacher)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color(.systemBackground))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.05), radius: 5)
                            }
                            .padding(.bottom, 20)
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal)
            }
            .background(Color(.systemGray6))
        }
        .navigationBarHidden(true)
        .sheet(item: $selectedLesson) { lesson in
            DersDetayView(lesson: lesson)
                .presentationDetents([.height(250), .medium])
                .presentationDragIndicator(.visible)
        }
    }
}
