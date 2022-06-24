//
//  DateFormatter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 24.06.2022.
//

import Foundation

enum DateConverter {
    static func showShortDay(_ dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let transfetDate = dateFormatter.date(from: dateString) else { return "" }
        dateFormatter.dateFormat = "MMM d, yyyy"
        let stringDate = dateFormatter.string(from: transfetDate)
        return stringDate
    }
}
