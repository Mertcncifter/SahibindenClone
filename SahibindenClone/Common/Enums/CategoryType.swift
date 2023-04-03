//
//  CategoryType.swift
//  SahibindenClone
//
//  Created by mert can çifter on 26.03.2023.
//

import UIKit


enum CategoryType: Int, CaseIterable {
    case estate
    case vehicle
    case piece
    case shopping
    case machine
    case service
    case lesson
    case job
    case helper
    case animal
    case urgent
    case last48hours
    
    
    var title: String {
        switch self {
        case .estate:
            return "Emlak"
        case .vehicle:
            return "Vasıta"
        case .piece:
            return "Yedek Parça,Aksesuar,Donanım"
        case .shopping:
            return "İkinci El Sıfır Alışveriş"
        case .machine:
            return "İş Makineleri & Sanayi"
        case .service:
             return "Ustalar ve Hizmetler"
        case .lesson:
            return "Özel Ders Verenler"
        case .job:
            return "İş İlanları"
        case .helper:
            return "Yardımcı Arayanlar"
        case .animal:
            return "Hayvanlar Alemi"
        case .urgent:
            return "Acil Acil"
        case .last48hours:
            return "Son 48 Saat"
        }
    }
    
    var subTitle: String {
        switch self {
        case .estate:
            return "Konut, İş Yeri,Arsa, Konut Projeleri, Bina"
        case .vehicle:
            return "Otomobil, Arazi,SUV & Pickup, Motosiklet"
        case .piece:
            return "Otomotiv Ekiplanları, Motosiklet Ekipmanları"
        case .shopping:
            return "Bilgisayar, Cep Telefonu"
        case .machine:
            return "İş Makineleri, Tarım Makineleri"
        case .service:
            return "Ev Tadilat & Dekorasyon, Nakliye"
        case .lesson:
            return "Liste & Üniviversite, İlkokul & Ortaokul"
        case .job:
            return "Avukatlık & Hukuki Danışmanlık, Eğitim, Eğlence"
        case .helper:
            return "Bebek & Çocuk Bakıcısı, Yaşlı & Hasta Bakıcısı"
        case .animal:
            return "Evcil Hayvanlar, Akvaryum Balıkları"
        case .urgent:
            return ""
        case .last48hours:
            return ""
        }
    }
    
    var color: UIColor {
        switch self {
        case .estate:
            return .orange
        case .vehicle:
            return .red
        case .piece:
            return UIColor(r: 84, g: 182, b: 186)
        case .shopping:
            return .purple
        case .machine:
            return UIColor(r: 158, g: 97, b: 251)
        case .service:
            return UIColor(r: 93, g: 156, b: 220)
        case .lesson:
            return UIColor(r: 109, g: 177, b: 130)
        case .job:
            return UIColor(r: 155, g: 184, b: 83)
        case .helper:
            return UIColor(r: 235, g: 134, b: 83)
        case .animal:
            return UIColor(r: 87, g: 184, b: 227)
        case .urgent:
            return .gray
        case .last48hours:
            return .gray
        }
    }
    
    var icon: String {
        switch self {
        case .estate:
            return "house"
        case .vehicle:
            return "car.fill"
        case .piece:
            return "wrench.and.screwdriver.fill"
        case .shopping:
            return "cart"
        case .machine:
            return "bus.fill"
        case .service:
            return "clock.arrow.2.circlepath"
        case .lesson:
            return "book.fill"
        case .job:
            return "person"
        case .helper:
            return "cart"
        case .animal:
            return "pawprint"
        case .urgent:
            return "person"
        case .last48hours:
            return "person"
        }
    }
}


