//
//  DetailedInfoRouter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

protocol IDetailedInfoRouter: AnyObject {
}

final class DetailedInfoRouter {
    weak var vc: UIViewController?
}

extension DetailedInfoRouter: IDetailedInfoRouter{
}
