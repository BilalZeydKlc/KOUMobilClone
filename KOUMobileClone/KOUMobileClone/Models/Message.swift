//
//  Message.swift
//  KOUMobileClone
//
//  Created by Bilal Zeyd Kılıç on 7.04.2026.
//

import Foundation

struct Message: Identifiable{
    let id = UUID()
    let sender: String
    let subject: String
    let body: String
    let date: String
}

struct MockData{
    static let messages = [
        Message(sender: "Bilal Zeyd", subject: "Bugünkü Ders Hakkında", body: "Sabahki Dersin telafisi yarın yapılackatır", date: "Mart, 17 2026 12:20:30"),
        Message(sender: "Bilal Zeyd", subject: "Bugünkü Ders Hakkında", body: "Sabahki Dersin telafisi yarın yapılackatır", date: "Mart, 17 2026 12:20:30"),
        Message(sender: "Bilal Zeyd", subject: "Bugünkü Ders Hakkında", body: "Sabahki Dersin telafisi yarın yapılackatır", date: "Mart, 17 2026 12:20:30"),
        Message(sender: "Bilal", subject: "Yapay Zeka", body: "Yapay Zeka Hakkında Bilgi Almak İsteyenler Gelebilir", date: "Nisan, 7 2026 12:20:30"),
        Message(sender: "Bilal Zeyd", subject: "Bugünkü Ders Hakkında", body: "Sabahki Dersin telafisi yarın yapılackatır", date: "Mart, 17 2026 12:20:30"),
        Message(sender: "Bilal Zeyd", subject: "Bugünkü Ders Hakkında", body: "Sabahki Dersin telafisi yarın yapılackatır", date: "Mart, 17 2026 12:20:30"),
        Message(sender: "Bilal Zeyd", subject: "Bugünkü Ders Hakkında", body: "Sabahki Dersin telafisi yarın yapılackatır", date: "Mart, 17 2026 12:20:30")
    ]
}
