//
//  Colors.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

enum Colors {
    case placeholderBlue
    case backgroundBlue
    case purple
    case blueGray
    case backgroundAlmostBlack
    
    var value: UIColor {
        switch self {
        case .placeholderBlue:
            return UIColor(red: 46/255, green: 40/255, blue: 64/255, alpha: 1)
        case .backgroundBlue:
            return UIColor(red: 38/255, green: 30/255, blue: 53/255, alpha: 1)
        case .purple:
            return UIColor(red: 205/255, green: 141/255, blue: 253/255, alpha: 1)
        case .blueGray:
            return UIColor(red: 64/255, green: 54/255, blue: 84/255, alpha: 1)
        case .backgroundAlmostBlack:
            return UIColor(red: 45/255, green: 37/255, blue: 61/255, alpha: 1)
        }
    }
}
