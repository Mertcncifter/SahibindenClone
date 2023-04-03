//
//  Section.swift
//  SahibindenClone
//
//  Created by mert can çifter on 4.04.2023.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let subTitle: String
    let icon: String
    let handler: () -> Void
}
