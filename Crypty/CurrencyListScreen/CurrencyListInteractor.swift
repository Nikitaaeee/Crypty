//
//  CurrencyListInteractor.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ICurrencyListInteractor: AnyObject {
    func getData() -> [CurrencyListViewModel]
}

class CurrencyListInteractor {
    
}

extension CurrencyListInteractor: ICurrencyListInteractor {
    func getData() -> [CurrencyListViewModel] {
        var entity = [CurrencyListViewModel]()
        for i in 1...10 {
            let image = "shiba-inu1"
            let currencyShortName = "Name - \(i)"
            let currencyFullName = "FullName - \(i)"
            let price = "$ \(i*152)"
            var percent = ""
            if i % 2 != 0 {
                percent += "-\(Double(i) / 0.63)"
            } else {
                percent += "+\(Double(i) / 0.42)"
            }
            entity.append(CurrencyListViewModel(image: image,currencyShortName: currencyShortName, currencyFullName: currencyFullName, price: price, percent: percent))
        }
        return entity
    }
}
