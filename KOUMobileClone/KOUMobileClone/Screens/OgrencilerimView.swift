//
//  OgrencilerimView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 7.04.2026.
//

import SwiftUI

struct Ogrenci: Identifiable{
    let id = UUID()
    let name: String
    let studentNo: String
}

struct OgrencilerimView: View{
    @Environment(\.dismiss) var dismiss
    
    let ogrenciler = [
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
        Ogrenci(name: "Bilal Zeyd Kılıç", studentNo: "15151515151"),
    ]
    
    var body: some View{
        NavigationStack{
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
                    Text("Öğrencilerim").font(.headline).fontWeight(.bold)
                    Spacer()
                    Text("Geri").foregroundColor(.clear).padding(.leading, 15)
                }
                .padding()
                .background(Color(.systemBackground))
                
                ScrollView{
                    VStack(spacing: 20){
                        VStack(spacing: -5){
                            Text("14")
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(.green)
                            Text("Öğrenci")
                                .font(.headline)
                                .foregroundColor(.gray)
                        }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                        
                        VStack(spacing: 12){
                            ForEach(ogrenciler){ ogrenci in
                                NavigationLink(destination: OgrenciDetayView(ogrenci: ogrenci)){
                                    HStack(spacing: 16){
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color(.systemGray5))
                                            .frame(width: 70, height: 75)
                                            .overlay(
                                                Image(systemName: "person.fill")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .foregroundColor(.gray.opacity(0.5))
                                                    .padding(15)
                                            )
                                        VStack(alignment: .leading, spacing: 6){
                                            Text(ogrenci.name.uppercased())
                                                .font(.subheadline)
                                                .fontWeight(.bold)
                                                .foregroundColor(.primary)
                                            
                                            Text(ogrenci.studentNo)
                                                .font(.subheadline)
                                                .foregroundColor(.gray.opacity(0.8))
                                        }
                                        Spacer()
                                    }
                                }
                                .padding(12)
                                .background(Color(.systemBackground))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        .padding(.horizontal)
                    }
                }
                .background(Color(.systemGray6))
            }
        }
    }
}

