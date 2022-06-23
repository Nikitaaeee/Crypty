//
//  DIManager.swift
//  Crypty
//
//  Created by Nikita Kirshin on 22.06.2022.
//

import Foundation

final class DIManager {
    let networkService: INetworkService
    
    init(){
        networkService = NetworkService()
    }
}
