//
//  CurrencyListViewModel.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

struct CurrencyListViewModel: Decodable {
    let id: String
    let currencyShortName: String
    let currencyFullName: String
    let price: String
    let percent: String
    var image: URL?

}

extension CurrencyListViewModel {
    init(from data: Datum) {
        guard let id = data.id,
              let currencyFullName = data.name,
              let price = data.metrics?.marketData?.priceUsd,
              let percent = data.metrics?.marketData?.percentChangeUsdLast24_Hours else { assert(false) }
        self.id = id
        self.currencyShortName = data.symbol
        self.currencyFullName = currencyFullName
        self.price = NumberConverter.converter(number: price)
        self.percent = String(format: "%.3f", percent)
        self.image = nil
    }
}
