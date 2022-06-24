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
    var networkService: INetworkService
    var datum: Datum
    
    init(networkService: INetworkService, datum: Datum) {
        self.networkService = networkService
        self.datum = datum
    }
}

extension DetailedInfoInteractor: IDetailedInfoInteractor {
    func getData() -> DetailedInfoViewModel {
        let model = DetailedInfoViewModel(from: datum)
    return model
    }
}
