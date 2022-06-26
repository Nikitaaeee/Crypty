//
//  DetailedInfoPresenter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol IDetailedInfoPresenter: AnyObject {
    func viewDidLoad(view: IDetailedInfoView)
    func didTapFavoriteButton()
}

final class DetailedInfoPresenter {
    private var view: IDetailedInfoView?
    private var interactor : IDetailedInfoInteractor?
    private var router: IDetailedInfoRouter?
    private var currentWeatherViewModel: DetailedInfoViewModel?
    private let favoriteCryptoService: IFavoriteCryptoService
    var coinName: String?
    
    init(interactor: IDetailedInfoInteractor, router: IDetailedInfoRouter, favoriteCryptoService: IFavoriteCryptoService) {
        self.interactor = interactor
        self.router = router
        self.favoriteCryptoService = favoriteCryptoService
    }
}

extension DetailedInfoPresenter: IDetailedInfoPresenter {
    func viewDidLoad(view: IDetailedInfoView) {
        let data: DetailedInfoViewModel?
        self.view = view
        data = interactor?.getData()
        if let data = data {
            coinName = data.symbol
            self.view?.getData(data: data)
        }
        
        guard let coinName = coinName else {
            return
        }
        
        checkFavorite(coinName: coinName) { isFavorite in
            view.setCoinFavoriteStatus(isFavorite: isFavorite)
        }
    }
    
    func didTapFavoriteButton() {
        guard let coinName = coinName else {
            return
        }
        
        checkFavorite(coinName: coinName) { [weak self] isFavorite in
            isFavorite ?
            self?.favoriteCryptoService.remove(coin: coinName) :
            self?.favoriteCryptoService.save(coin: coinName)
            self?.view?.setCoinFavoriteStatus(isFavorite: !isFavorite)
        }
    }
    
    func checkFavorite(coinName: String, completion: @escaping (Bool) -> Void) {
        favoriteCryptoService.favoriteList { coins in
            completion(coins.contains(coinName))
        }
    }
}
