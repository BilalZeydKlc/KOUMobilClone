//
//  StoryCarousel.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 17.02.2026.
//
import SwiftUI
struct StoryCarousel: View{
    let storyImages = ["story1", "story2", "story3","story4","story5","story6","story7","story8","story9","story10"]
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 15){
                ForEach(storyImages, id: \.self){ imageName in
                    Circle()
                        .stroke(Color.kouGreen, lineWidth: 2)
                        .frame(width: 70, height: 70)
                        .overlay(
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .clipShape(Circle())
                                .padding(4)
                        )  
                }
            }
            .padding(.horizontal)
        }
    }
}
