//
//  CurrencyListInteractor.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ICurrencyListInteractor: AnyObject {
    func generateData(completion: @escaping (CryptoDTO?) -> Void)
    func loadImage(coinName: String, completion: @escaping(Data) -> ())

}

final class CurrencyListInteractor {
    var networkService: INetworkService
    
    init(networkService: INetworkService) {
        self.networkService = networkService
    }
}

extension CurrencyListInteractor: ICurrencyListInteractor {
    
    func generateData(completion: @escaping (CryptoDTO?) -> Void) {
        self.networkService.loadCurrencyList { (result: Result<CryptoDTO, Error>) in
            switch result {
            case .success(let model):
                DispatchQueue.main.async {
                    completion(model)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(String(describing: error))
                    print("Presenter: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
    }
    
    func loadImage(coinName: String, completion: @escaping (Data) -> ()) {
        networkService.loadCoinImage(coinName: coinName) { (result: Result<Data, Error>) in
            switch result {
            case .success(let data):
                completion(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
