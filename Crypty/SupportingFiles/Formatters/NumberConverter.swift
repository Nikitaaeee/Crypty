//
//  NumberConverter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import Foundation

class NumberConverter {
    static func converter(number: Double) -> String{
        var stringNubmer = ""
        if number <= 0.001 {
            stringNubmer = "$ " + String(format: "%.6f", number)
        } else if number <= 1 {
            stringNubmer = "$ " + String(format: "%.3f", number)
        } else {
            stringNubmer = "$ " + String(format: "%.1f", number)
        }
        return stringNubmer
    }
}
