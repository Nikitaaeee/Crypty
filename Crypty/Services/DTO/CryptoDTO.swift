//
//  CryptoDTO.swift
//  Crypty
//
//  Created by Nikita Kirshin on 22.06.2022.
//

import Foundation

// MARK: - Welcome
struct CryptoDTO: Codable {
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: String?
    let symbol: String?
    let name: String?
    let metrics: Metrics?
    let profile: Profile?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case symbol = "symbol"
        case name = "name"
        case metrics = "metrics"
        case profile = "profile"
    }
}


// MARK: - Metrics
struct Metrics: Codable {
    let marketData: MarketData?
    let marketcap: Marketcap?
    let allTimeHigh: AllTimeHigh?

    enum CodingKeys: String, CodingKey {
        case marketData = "market_data"
        case marketcap = "marketcap"
        case allTimeHigh = "all_time_high"
    }
}

// MARK: - AllTimeHigh
struct AllTimeHigh: Codable {
    let price: Double?
    let at: String?
    let daysSince: Int?
    let percentDown: Double?

    enum CodingKeys: String, CodingKey {
        case price = "price"
        case at = "at"
        case daysSince = "days_since"
        case percentDown = "percent_down"
    }
}

// MARK: - MarketData
struct MarketData: Codable {
    let priceUsd: Double?
    let percentChangeUsdLast24_Hours: Double?
    let ohlcvLast1_Hour: OhlcvLastHour?
    let ohlcvLast24_Hour: OhlcvLastHour?

    enum CodingKeys: String, CodingKey {
        case priceUsd = "price_usd"
        case percentChangeUsdLast24_Hours = "percent_change_usd_last_24_hours"
        case ohlcvLast1_Hour = "ohlcv_last_1_hour"
        case ohlcvLast24_Hour = "ohlcv_last_24_hour"
    }
}

// MARK: - OhlcvLastHour
struct OhlcvLastHour: Codable {
    let high: Double?
    let low: Double?

    enum CodingKeys: String, CodingKey {
        case high = "high"
        case low = "low"

    }
}

// MARK: - Marketcap
struct Marketcap: Codable {
    let rank: Int?

    enum CodingKeys: String, CodingKey {
        case rank = "rank"
    }
}

// MARK: - Profile
struct Profile: Codable {
    let general: ProfileGeneral?

    enum CodingKeys: String, CodingKey {
        case general = "general"
    }
}

// MARK: - ProfileGeneral
struct ProfileGeneral: Codable {
    let overview: GeneralOverview?

    enum CodingKeys: String, CodingKey {
        case overview = "overview"
    }
}

// MARK: - GeneralOverview
struct GeneralOverview: Codable {
    let projectDetails: String?

    enum CodingKeys: String, CodingKey {
        case projectDetails = "project_details"
    }
}
