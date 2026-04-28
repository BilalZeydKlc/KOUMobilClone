//
//  DersDetayView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 1.04.2026.
//

import SwiftUI

struct DersDetayView: View{
    let lesson: Lesson
    
    var body: some View{
        VStack(alignment: .leading, spacing: 22){
            
            Text(lesson.name)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.top, 15)
            
            HStack(spacing: 15){
                Image(systemName: "person")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text(lesson.teacher)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            HStack(spacing: 15){
                Image(systemName: "book")
                    .font(.title3)
                    .foregroundColor(.gray)
                
                Text(lesson.classroom)
                    .font(.title3)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding(30)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
