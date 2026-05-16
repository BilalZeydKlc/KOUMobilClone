//
//  AkademisyenMesajDetayView.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 16.05.2026.
//

import SwiftUI

struct AkademisyenChatMessage: Identifiable {
    let id = UUID()
    let text: String
    let time: String
    let isCurrentUser: Bool
}

struct AkademisyenMesajDetayView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isReplying = false
    @State private var replyText = ""
    
    let messages = [
        AkademisyenChatMessage(text: "Hocam merhaba, sınav notum hakkında konuşmak istiyorum. Bugün müsaitseniz odanıza gelebilir miyim?", time: "29/04/2026 10:29", isCurrentUser: false),
        AkademisyenChatMessage(text: "Merhaba Bilal, 14.00 gibi gelebilirsin.", time: "29/04/2026 11:30", isCurrentUser: true)
    ]
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            VStack(spacing: 0) {
                HStack(spacing: 12) {
                    Button(action: { dismiss() }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.primary)
                    }
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Bugünkü Ders Hakkında")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("Bilal Zeyd Kılıç")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                .background(Color(.systemBackground))
                
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(messages) { msg in
                            AkademisyenChatBubbleView(message: msg)
                        }
                    }
                    .padding()
                }
                .background(Color(.systemGray6))
            }
            
            Button(action: {
                isReplying = true
            }) {
                Image(systemName: "square.and.pencil")
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(width: 60, height: 60)
                    .background(Color(red: 0.13, green: 0.55, blue: 0.27))
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
            }
            .padding(.trailing, 20)
            .padding(.bottom, 30)
        }
        .navigationBarHidden(true)
        
        .sheet(isPresented: $isReplying) {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Button(action: { isReplying = false }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .font(.title)
                            .padding()
                    }
                }
                
                TextEditor(text: $replyText)
                    .padding(10)
                    .frame(height: 200)
                    .background(Color(.systemBackground))
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray.opacity(0.3), lineWidth: 1))
                    .padding(.horizontal)
                
                Button(action: {
                    isReplying = false
                    replyText = ""
                }) {
                    HStack {
                        Image(systemName: "paperplane")
                        Text("Gönder")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color(red: 0.13, green: 0.55, blue: 0.27))
                    .cornerRadius(12)
                }
                .padding()
                Spacer()
            }
            .background(Color(.systemGray6).ignoresSafeArea())
            .presentationDetents([.medium, .large])
        }
    }
}

struct AkademisyenChatBubbleView: View {
    var message: AkademisyenChatMessage
    
    var body: some View {
        HStack {
            if message.isCurrentUser { Spacer() }
            
            VStack(alignment: .trailing, spacing: 4) {
                Text(message.text)
                    .font(.subheadline)
                    .foregroundColor(message.isCurrentUser ? .white : .primary)
                    .multilineTextAlignment(.leading)
                
                Text(message.time)
                    .font(.system(size: 10))
                    .foregroundColor(message.isCurrentUser ? Color.white.opacity(0.8) : .gray)
            }
            .padding(14)
            .background(message.isCurrentUser ? Color(red: 0.13, green: 0.55, blue: 0.27) : Color.white)
            .cornerRadius(16, corners: message.isCurrentUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
            .shadow(color: Color.black.opacity(0.04), radius: 3, y: 1)
            .frame(maxWidth: UIScreen.main.bounds.width * 0.75, alignment: message.isCurrentUser ? .trailing : .leading)
            
            if !message.isCurrentUser { Spacer() }
        }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
