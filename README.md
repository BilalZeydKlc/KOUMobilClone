# 📱 KOU Mobile Clone - Öğrenci Bilgi Sistemi

![Swift](https://img.shields.io/badge/Swift-5.10-FA7343?style=for-the-badge&logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-Framework-blue?style=for-the-badge&logo=swift&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-16.0+-black?style=for-the-badge&logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-15.0+-157EFB?style=for-the-badge&logo=xcode&logoColor=white)

Kocaeli Üniversitesi (KOU) resmi mobil uygulamasının, modern **SwiftUI** teknolojileri ve Apple HIG (Human Interface Guidelines) standartları kullanılarak sıfırdan geliştirilmiş, birebir aynı klon projesidir. 

Bu proje, **Kocaeli Üniversitesi Bilgisayar Araştırma ve Uygulama Merkezi (BAUM)** stajım kapsamında geliştirilmiş olup; akademik bir vizyonla tasarlanmış modüler mimari ve tekrar kullanılabilir (reusable) bileşenler üzerine inşa edilmiştir.

---

## 🚀 Öne Çıkan Özellikler (Features)

Uygulama, hem **Öğrenci** hem de **Akademisyen** rollerini destekleyen çoklu (Multi-Role) bir yapıya sahiptir.

### 👨‍🏫 Akademisyen Modülü
* **Dinamik Öğrenci Listesi:** Akademisyene bağlı öğrencilerin listelendiği, `NavigationStack` ile güvenli veri aktarımının sağlandığı özel liste görünümü.
* **Detaylı Profil Ekranı:** Öğrencinin AGNO, Mezuniyet Ortalaması gibi kritik metriklerini gösteren özel istatistik kartları.
* **Akordeon Menüler:** Ekran alanından tasarruf etmek için `.spring()` animasyonuyla tasarlanmış "Genel Bilgiler" ve "Ek Bilgiler" genişleyebilir (Accordion) UI bileşenleri.

### 🎓 Öğrenci Modülü
* **Mesajlaşma Sistemi:** Gelen mesajları okuma ve arama çubuğu üzerinden `.filter` algoritmasıyla anlık sorgulama yapabilme.
* **Gelişmiş Not Durumu (Grades):** * Özel tasarlanmış ve animasyonlu Tab Bar (Yarıyıl / Genel geçişleri).
  * Yarıyıl sekmesinde, vizeler ve finallerle harmanlanmış şık ders kartları (`GradeCardView`).
  * Genel sekmesinde, öğrencinin tüm akademik geçmişini listeleyen iç içe geçmiş dinamik akordeon listeler.

---

## 🛠 Teknik Altyapı ve Mimari

Proje, ölçeklenebilir ve okunabilir bir kod tabanı oluşturmak amacıyla modern iOS geliştirme pratikleriyle yazılmıştır.

* **Frontend:** SwiftUI
* **Navigasyon:** iOS 16+ `NavigationStack` & `NavigationLink`
* **UI/UX Prensipleri:** * Özel State yönetimi (`@State`, `@Binding`)
  * Tekrar kullanılabilir (Reusable) alt bileşenler (Örn: `InfoRow`, `TabButonu`, `GradeCardView`)
  * Pürüzsüz geçişler için `withAnimation` entegrasyonları
  * Pixel Perfect hizalamalar ve Auto Layout standartları

---

## 👨‍💻 Geliştirici

**Bilal Zeyd Kılıç** - iOS Developer Adayı
