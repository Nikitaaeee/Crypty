//
//  CurrencyListInteractor.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ICurrencyListInteractor: AnyObject {
//    func generateData() -> [CurrencyListViewModel]
    func generateData(completion: @escaping (CryptoDTO?) -> Void)

}

class CurrencyListInteractor {
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
                print("NOOOORMM")
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
    
//    func generateData(currencies: [String], completion: @escaping (CryptoDTO?) -> Void) {
//        networkService.downloadCurrencies(currencies: currencies) { (result: Result<CryptoDTO, Error>) in
//            switch result {
//            case .success(let model):
//                DispatchQueue.main.async {
//                    completion(model)
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    print("Presenter: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            }
//        }
//    }
}

    
//    func downloadUrls(currency: [String], completion: @escaping ([CurrencyListViewModel]) -> Void) {
//        var subjectCollection: [CurrencyListViewModel] = []
//        let urlDownloadQueue = DispatchQueue(label: "com.urlDownloader.urlqueue")
//        let urlDownloadGroup = DispatchGroup()
//        
//        currency.forEach { (currency) in
//            urlDownloadGroup.enter()
//            networkService.loadCurrencyData(currency: currency) { (result: Result<CryptoDTO, Error>) in
//                switch result {
//                case .success(let model):
//                    DispatchQueue.main.async {
//                        completion(CurrencyListViewModel(from: model))
//                    }
//                case .failure(let error):
//                    DispatchQueue.main.async {
//                        print("Presenter: \(error.localizedDescription)")
//                        completion(CurrencyListViewModel(from: nil))
//                    }
//                }
//            }
//        }
//    }
    
//    func generateData(city: String, completion: @escaping (CryptoDTO?) -> Void) {
//        self.networkService.loadCurrencyData(currency: city) { (result: Result<CryptoDTO, Error>) in
//            switch result {
//            case .success(let model):
//                DispatchQueue.main.async {
//                    completion(model)
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    print("Presenter: \(error.localizedDescription)")
//                    completion(nil)
//                }
//            }
//        }
//    }
//    func generateData() -> [CurrencyListViewModel] {
//        var entity = [CurrencyListViewModel]()
//        for i in 1...10 {
//            let image = "shiba-inu1"
//            let currencyShortName = "Name - \(i)"
//            let currencyFullName = "FullName - \(i)"
//            let price = "$ \(i*152)"
//            var percent = ""
//            if i % 2 != 0 {
//                percent += "-\(Double(i) / 0.63)"
//            } else {
//                percent += "+\(Double(i) / 0.42)"
//            }
//            entity.append(CurrencyListViewModel(image: image,currencyShortName: currencyShortName, currencyFullName: currencyFullName, price: price, percent: percent))
//        }
//        return entity
//    }
    

//let image: String
//let currencyShortName: String
//let currencyFullName: String
//let price: String
//let percent: String
