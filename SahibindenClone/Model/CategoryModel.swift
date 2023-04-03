//
//  CategoryModel.swift
//  SahibindenClone
//
//  Created by mert can çifter on 26.03.2023.
//

import Foundation

struct CategoryModel {
    let id: Int
    let type: CategoryType
}

extension CategoryModel {
    static var exampleData: [CategoryModel] = [
        CategoryModel(id: 1, type: .estate),
        CategoryModel(id: 2, type: .vehicle),
        CategoryModel(id: 3, type: .piece),
        CategoryModel(id: 4, type: .shopping),
        CategoryModel(id: 5, type: .machine),
        CategoryModel(id: 6, type: .service),
        CategoryModel(id: 7, type: .lesson),
        CategoryModel(id: 8, type: .helper),
        CategoryModel(id: 9, type: .animal),
        CategoryModel(id: 10, type: .urgent),
        CategoryModel(id: 11, type: .last48hours),
    ]
}
