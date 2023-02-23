//
//  DetailedInfoViewModel.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

struct DetailedInfoViewModel {
    let name: String
    let symbol: String
    let price: String
    let percent: Double
    let high24: String
    let low24: String
    let rating: String
    let allTimeHigh: String
    let at: String
    let daysSince: String
    let percentDown: String
    let infoText: String
}

extension DetailedInfoViewModel {
    
    init(from data: Datum) {
        self.name = data.name ?? "No Name"
        self.symbol = data.symbol
        self.price = NumberConverter.converter(number: data.metrics?.marketData?.priceUsd ?? 0)
        self.percent = data.metrics?.marketData?.percentChangeUsdLast24_Hours ?? 0
        self.high24 = NumberConverter.converter(number: data.metrics?.marketData?.ohlcvLast24_Hour?.high ?? 0)
        self.low24 = NumberConverter.converter(number: data.metrics?.marketData?.ohlcvLast24_Hour?.low ?? 0)
        self.rating = String(data.metrics?.marketcap?.rank ?? 0)
        self.allTimeHigh = NumberConverter.converter(number: data.metrics?.allTimeHigh?.price ?? 0)
        self.at = DateConverter.showShortDay(data.metrics?.allTimeHigh?.at ?? "2022-06-28T15:21:02Z")
        self.daysSince = String(data.metrics?.allTimeHigh?.daysSince ?? 0)
        self.percentDown = "- " + String(format: "%.3f", data.metrics?.allTimeHigh?.percentDown ?? 0) + "%"
        self.infoText = data.profile?.general?.overview?.projectDetails ?? "No Info"
    }
}

