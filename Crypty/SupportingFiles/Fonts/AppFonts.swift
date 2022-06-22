//
//  AppFonts.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

enum AppFonts {
    case semibold30
    case semibold24
    case semibold16
    case bold30
    case bold24
    case medium30
    case medium20
    case medium16
    case medium14
    case medium12
    case regular24
    case regular20
    case regular18
    case regular16
    
    var font: UIFont? {
        switch self {
        case .semibold30:
            return UIFont(name: "RobotoMono-SemiBold", size: 30)
        case .semibold24:
            return UIFont(name: "RobotoMono-SemiBold", size: 24)
        case .semibold16:
            return UIFont(name: "RobotoMono-SemiBold", size: 16)
        case .bold30:
            return UIFont(name: "Roboto-Bold", size: 30)
        case .bold24:
            return UIFont(name: "Roboto-Bold", size: 24)
        case .medium30:
            return UIFont(name: "Roboto-Medium", size: 30)
        case .medium20:
            return UIFont(name: "Roboto-Medium", size: 20)
        case .medium16:
            return UIFont(name: "Roboto-Medium", size: 16)
        case .medium14:
            return UIFont(name: "Roboto-Medium", size: 14)
        case .medium12:
            return UIFont(name: "Roboto-Medium", size: 12)
        case .regular24:
            return UIFont(name: "Roboto-Regular", size: 24)
        case .regular20:
            return UIFont(name: "Roboto-Regular", size: 20)
        case .regular18:
            return UIFont(name: "Roboto-Regular", size: 18)
        case .regular16:
            return UIFont(name: "Roboto-Regular", size: 16)
        }
    }
}
