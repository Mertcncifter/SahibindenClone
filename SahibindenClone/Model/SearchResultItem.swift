//
//  SearchResultItem.swift
//  SahibindenClone
//
//  Created by mert can çifter on 29.03.2023.
//

import Foundation

struct SearchResultItem {
    let id: Int
    let title: String
    let city: String
    let district: String
    let price: Double
    let createdDate: Date
    let feature: [AddionatalFeature]
    
    init(id: Int, title: String, city: String, district: String, price: Double, createdDate: Date, feature: [AddionatalFeature]) {
        self.id = id
        self.title = title
        self.city = "İstanbul"
        self.district = Helper.randomDistrict()
        self.price = price
        self.createdDate = createdDate
        self.feature = feature
    }
}


struct AddionatalFeature {
    let title: String
    let desc: String
}


extension SearchResultItem {
    static var estateResult: [SearchResultItem] = [
        SearchResultItem(id: 1,title: "SAHİBİNDEN SIFIR 3+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 2, title: "SAHİBİNDEN SIFIR 2+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 3, title: "SAHİBİNDEN SIFIR 4+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 4, title: "SAHİBİNDEN SIFIR 3+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 5, title: "SATILIK ULTRA LÜKS MERKEZİ KONUMDA DUBLEKS DAİRE!",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 6, title: "SİTE İÇİNDE METRÖBÜSE YAKIN 1+1 SATILIK DAİRE",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 7, title: "Pendik Edonia Garden Sitesi 2+1 95 m2",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 8, title: "3+1 BAHÇE DUBLEX || BALABAN MODERN",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 9, title: "KOŞUYOLU KARAYOLLARI SİTESİN DE YATIRIMLIK DAİRE",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 10, title: "KAYA YAPI'DAN GÜZELYURT'TA FULL KONSEPT SİTEDE YATIRIMLIK 1+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 11, title: "SAHİBİNDEN SIFIR 3+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 12, title: "SAHİBİNDEN SIFIR 4+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 13, title: "SAHİBİNDEN SIFIR 1+1",city: "",district: "", price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 14, title: "Müsiad Konutları 3+1 (240 m2) özel bahçe katı",city: "",district: "",price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 15, title: "ALFA ART İNŞAAT'TAN Yalı'da Müstakil Taş Ev",city: "",district: "",price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 16, title: "FİNİKE'DE SATILIK DENİZ MANZARALI ÖZEL YAPIM TAŞ VİLLA - TAKASLI",city: "",district: "",price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 17, title: "For Sale KAMEROĞLU METROHOME BEYLİKDÜZÜ 3+1 193m2",city: "",district: "",price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 18, title: "SAHİBİNDEN SIFIR 1+1",city: "",district: "",price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 19, title: "SAHİBİNDEN SIFIR 2+1",city: "",district: "",price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        SearchResultItem(id: 20, title: "SAHİBİNDEN SIFIR 3+1",city: "",district: "",price: Double.random(in: 100000 ... 5000000),createdDate: Helper.randomDate(), feature: AddionatalFeature.estateFeature),
        
        
    ]
}

extension AddionatalFeature {
    
    static var estateFeature: [AddionatalFeature] = [
        AddionatalFeature(title: "İlan No", desc: Helper.randomString(length: 12)),
        AddionatalFeature(title: "Emlak Tipi", desc: Helper.randomEstateType()),
        AddionatalFeature(title: "m2 (Brüt)", desc: "\(Int.random(in: 5..<1000))"),
        AddionatalFeature(title: "m2 (Net)", desc: "\(Int.random(in: 5..<5000))"),
        AddionatalFeature(title: "Oda Sayısı", desc: "\(Int.random(in: 1..<10))"),
        AddionatalFeature(title: "Bina Yaşı", desc: "\(Int.random(in: 1..<50))"),
        AddionatalFeature(title: "Bulunduğu Kat", desc: "\(Int.random(in: 1..<50))"),
        AddionatalFeature(title: "Kat Sayısı", desc: "\(Int.random(in: 1..<100))"),
        AddionatalFeature(title: "Isıtma", desc: "Merkezi"),
        AddionatalFeature(title: "Banyo Sayısı", desc: "\(Int.random(in: 1..<3))"),
        AddionatalFeature(title: "Balkon", desc: "Var"),
        AddionatalFeature(title: "Eşyalı", desc: "Hayır"),
        AddionatalFeature(title: "Kullanım Durumu", desc: "Boş"),
        AddionatalFeature(title: "Site İçerisinde", desc: "Hayır"),
        AddionatalFeature(title: "Site Adı", desc: "Belirtilmemiş"),
        AddionatalFeature(title: "Aidat(TL)", desc: "\(Int.random(in: 100..<1000))"),
        AddionatalFeature(title: "Takas", desc: "Hayır"),
    
    ]
}

