//
//  NumberConverter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import Foundation

class NumberConverter {
//    static func converter(number: Double) -> String{
//        let currencyFormatter = NumberFormatter()
//        currencyFormatter.usesGroupingSeparator = true
//        currencyFormatter.numberStyle = .currency
//        currencyFormatter.locale = Locale.current
//        return currencyFormatter.string(from: NSNumber(value: number))!
//    }
    static func converter(number: Double) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.groupingSeparator = ","
            numberFormatter.groupingSize = 3
            numberFormatter.usesGroupingSeparator = true
            numberFormatter.decimalSeparator = "."
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 2
            return numberFormatter.string(from: number as NSNumber)!
        }
   
}
