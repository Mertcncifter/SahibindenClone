//
//  Helper.swift
//  SahibindenClone
//
//  Created by mert can çifter on 29.03.2023.
//

import Foundation

class Helper {
    
    static func randomEstateType() -> String {
        let list: [String] = ["Satılık","Kiralık","Günlük Kiralık","Devren Satılık Konut"]
        return list.randomElement()!
    }
    
    static func randomDistrict() -> String {
        let list: [String] = ["Adalar","ArnavutKöy","Ataşehir","Avcılar","Bağcılar","Beşiktaş","Beykoz"]
        return list.randomElement()!
    }
    
    static func randomString(length: Int) -> String {
      let letters = "0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    static func randomDate() -> Date {
        var date1 = dateParse("2015-01-01")
        var date2 = dateParse("2023-01-01")
        if date2 < date1 {
            let temp = date1
            date1 = date2
            date2 = temp
        }
        let span = TimeInterval.random(in: date1.timeIntervalSinceNow...date2.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: span)
    }
    
    static func dateParse(_ string: String, format: String = "yyyy-MM-dd") -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = NSTimeZone.default
        dateFormatter.dateFormat = format

        let date = dateFormatter.date(from: string)!
        return date
    }
    
    static func df2so(_ price: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.decimalSeparator = "."
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: price as NSNumber)!
    }
}
