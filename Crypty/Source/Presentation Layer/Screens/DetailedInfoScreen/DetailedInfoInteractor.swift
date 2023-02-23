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
    
    //MARK: - Properties
    
    var networkService: INetworkService
    var datum: Datum
    
    //MARK: - Lifecycle
    
    init(networkService: INetworkService, datum: Datum) {
        self.networkService = networkService
        self.datum = datum
    }
}

//MARK: - IDetailedInfoInteractor
extension DetailedInfoInteractor: IDetailedInfoInteractor {
    func getData() -> DetailedInfoViewModel {
        let model = DetailedInfoViewModel(from: datum)
        
        return model
    }
}
