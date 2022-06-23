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
    
//    func generateData(coinName: String, completion: @escaping (CryptoDTO?) -> Void) {
//        networkService.loadCurrency(coinName: coinName) { (result: Result<CryptoDTO, Error>) in
//            switch result {
//            case .success(let model):
//                print("NOOOORMM")
//                DispatchQueue.main.async {
//                    completion(model)
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    print(String(describing: error))
//                    print("Presenter: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            }
//        }
//    }


}
