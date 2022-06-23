//
//  FavoriteCryptoService.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import Foundation

protocol IFavoriteCryptoService {
    func save(coin: String)
    func remove(coin: String)
    func favoriteList(completion: @escaping ([String]) -> Void)
    func resetFavoriteList()
}

final class FavoriteCryptoService: IFavoriteCryptoService {
    @UserDefaultsStorage(key: "FavoriteCryptoService.Coins", default: [])
    private var coins: Set<String>
    
    func save(coin: String) {
        coins.insert(coin)
    }
    
    func remove(coin: String) {
        coins.remove(coin)
    }
    
    func favoriteList(completion: @escaping ([String]) -> Void) {
        completion(Array(coins))
    }
    
    func resetFavoriteList() {
        coins = []
    }
}
