//
//  CategoryDetailModel.swift
//  SahibindenClone
//
//  Created by mert can çifter on 27.03.2023.
//

import Foundation


struct CategoryDetailModel {
    
    let id: Int
    let categoryId: Int
    let title: String
    
}


extension CategoryDetailModel {
    
    static var estateData: [CategoryDetailModel] = [
        CategoryDetailModel(id: 1, categoryId: 1, title: "Konut"),
        CategoryDetailModel(id: 2, categoryId: 1, title: "İş Yeri"),
        CategoryDetailModel(id: 3, categoryId: 1, title: "Arsa"),
        CategoryDetailModel(id: 4, categoryId: 1, title: "Konut Projeleri"),
        CategoryDetailModel(id: 5, categoryId: 1, title: "Devre Mülk"),
        CategoryDetailModel(id: 6, categoryId: 1, title: "Turistik Tesis")
    ]
}
