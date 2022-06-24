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
            currencyFormatter.numberStyle = .percent
            return currencyFormatter.string(from: NSNumber(value: number))!
        }
}
