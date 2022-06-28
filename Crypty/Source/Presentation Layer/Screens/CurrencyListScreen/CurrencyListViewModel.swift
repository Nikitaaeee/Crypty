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
        self.id = data.id ?? " No Id"
        self.currencyShortName = data.symbol
        self.currencyFullName = data.name ?? "NoName"
        self.price = NumberConverter.converter(number: data.metrics?.marketData?.priceUsd ?? 0)
        self.percent = String(format: "%.3f", data.metrics?.marketData?.percentChangeUsdLast24_Hours ?? 0)
        self.image = nil
    }
}
