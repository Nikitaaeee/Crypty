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
    let image: String?

}

extension CurrencyListViewModel {
    init(from data: Datum) {
        guard let id = data.id,
                let currencyShortName = data.symbol,
              let currencyFullName = data.name,
              let price = data.metrics?.marketData?.priceUsd,
              let percent = data.metrics?.marketData?.percentChangeUsdLast24_Hours else { assert(false) }
        self.id = id
        self.currencyShortName = currencyShortName
        self.currencyFullName = currencyFullName
        if price <= 0.001 {
            self.price = "$ " + String(format: "%.6f", price)
        } else if price <= 1 {
            self.price = "$ " + String(format: "%.3f", price)
        } else {
            self.price = "$ " + String(format: "%.1f", price)
        }
        self.percent = String(format: "%.3f", percent)
        self.image = nil
    }
}
