//
//  DetailedInfoInteractor.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol IDetailedInfoInteractor: AnyObject {
    func getData() -> DetailedInfoViewModel

}

final class DetailedInfoInteractor {
    
}

extension DetailedInfoInteractor: IDetailedInfoInteractor {
    func getData() -> DetailedInfoViewModel {
        return DetailedInfoViewModel()
    }
}
