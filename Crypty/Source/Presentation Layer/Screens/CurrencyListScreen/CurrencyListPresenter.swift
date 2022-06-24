//
//  CurrencyListPresenter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation
import UIKit

protocol ICurrencyListPresenter: AnyObject {
    func viewDidLoad(view: ICurrencyListView)
    func didTapFavoriteButton(isFavoriteChecked: Bool)
}

class CurrencyListPresenter {
    private var view: ICurrencyListView?
    private var interactor : ICurrencyListInteractor?
    private var router: ICurrencyListRouter?
    private var currentWeatherViewModel: CurrencyListViewModel?
    private let favoriteCryptoService: IFavoriteCryptoService
    var dtoModel: CryptoDTO?
    var data: [CurrencyListViewModel] = []
    
    init(interactor: ICurrencyListInteractor, router: ICurrencyListRouter, favoriteCryptoService: IFavoriteCryptoService) {
        self.interactor = interactor
        self.router = router
        self.favoriteCryptoService = favoriteCryptoService
    }
}

extension CurrencyListPresenter: ICurrencyListPresenter {
    func viewDidLoad(view: ICurrencyListView) {
        self.view = view
        self.interactor?.generateData(completion: { [weak self] model in
            guard let self = self else { return }
            guard let model = model else { return }
            self.dtoModel = model
            self.data = self.convertDataToModel(dto: model)
            view.getData(data: self.data)
        })
    }
    
    func convertDataToModel(dto: CryptoDTO) -> [CurrencyListViewModel] {
        var entity = [CurrencyListViewModel]()
        let int = dto.data.count - 1
        for i in 0...int {
            var model = CurrencyListViewModel(from: dto.data[i])
            model.image = URL(string:  NetworkService.Endpoints.urlPath + model.currencyShortName.lowercased() + NetworkService.Endpoints.urlEndpoint)
            entity.append(model)
        }
        return entity
    }
    
    func didTapFavoriteButton(isFavoriteChecked: Bool) {
        if isFavoriteChecked {
            favoriteCryptoService.favoriteList { [weak self] coins in
                guard let self = self else {
                    return
                }
                
                let data = self.data.filter {
                    coins.contains($0.currencyShortName)
                }
                
                self.view?.getData(data: data)
            }
        } else {
            view?.getData(data: data)
        }
    }
    
    func goToSelecterRow(for id: String) {
        guard let datum = dtoModel?.data.first(where: { datum in
            datum.id == id
        }) else {
            print("No model for ID")
            return
        }
        router?.goToSelecterRow(for: datum)
    }
}
