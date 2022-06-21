//
//  DetailedInfoAssembly.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

enum DetailedInfoAssembly {
    static func build() -> DetailedInfoViewController {
        let interactor = DetailedInfoInteractor()
        let router = DetailedInfoRouter()
        let presenter = DetailedInfoPresenter(interactor: interactor, router: router)
        let vc = DetailedInfoViewController(presenter: presenter)
        router.vc = vc
        
        return vc
    }
}
