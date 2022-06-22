//
//  PercentFormatter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import Foundation

class PercentConverter {
        static func converter(number: Double) -> String{
            let currencyFormatter = NumberFormatter()
//            currencyFormatter.usesGroupingSeparator = true
            currencyFormatter.numberStyle = .percent
//            currencyFormatter.locale = Locale.current
            return currencyFormatter.string(from: NSNumber(value: number))!
        }
}
