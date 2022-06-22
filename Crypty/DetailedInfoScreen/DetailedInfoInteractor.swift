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
        let entity = DetailedInfoViewModel(price: "22", percent: "2", high24: "33", low24: "11", rating: "1", allTimeHigh: "44", at: "02.03", daysSince: "23", percentDown: "14", infoText: "KAGKAJDKGJAKJGAKJGKAJKGJAKDJGKJGKADJG:KJAK:GJ")
    return entity
    }
}
