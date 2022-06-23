//
//  DetailedInfoViewModel.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

struct DetailedInfoViewModel {
    let price: String
    let percent: String
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
        guard let price = data.metrics?.marketData?.priceUsd,
              let percent = data.metrics?.marketData?.percentChangeUsdLast24_Hours,
              let high24 = data.metrics?.marketData?.ohlcvLast24_Hour?.high,
              let low24 = data.metrics?.marketData?.ohlcvLast24_Hour?.low,
              let rating = data.metrics?.marketcap?.rank,
              let allTimeHigh = data.metrics?.allTimeHigh?.price,
              let at = data.metrics?.allTimeHigh?.at,
              let daysSince = data.metrics?.allTimeHigh?.daysSince,
              let percentDown = data.metrics?.allTimeHigh?.percentDown,
              let infoText = data.profile?.general?.overview?.projectDetails else { assert(false) }
        
        self.price = NumberConverter.converter(number: price)
        self.percent = String(format: "%.3f", percent)
        self.high24 = NumberConverter.converter(number: high24)
        self.low24 = NumberConverter.converter(number: low24)
        self.rating = String(rating)
        self.allTimeHigh = NumberConverter.converter(number: allTimeHigh)
        self.at = at
        self.daysSince = String(daysSince)
        self.percentDown = String(format: "%.3f", percentDown)
        self.infoText = infoText
    }
}

