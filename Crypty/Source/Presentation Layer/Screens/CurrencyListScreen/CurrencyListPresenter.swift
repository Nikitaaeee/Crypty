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
}

class CurrencyListPresenter {
    private var view: ICurrencyListView?
    private var interactor : ICurrencyListInteractor?
    private var router: ICurrencyListRouter?
    private var currentWeatherViewModel: CurrencyListViewModel?
    var dtoModel: CryptoDTO?

    init(interactor: ICurrencyListInteractor, router: ICurrencyListRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension CurrencyListPresenter: ICurrencyListPresenter {
    func viewDidLoad(view: ICurrencyListView) {
        var data: [CurrencyListViewModel]?
        self.interactor?.generateData(completion: { [weak self] model in
            guard let self = self else { return }
            guard let model = model else { return }
            self.dtoModel = model
            data = self.convertDataToModel(dto: model)
            guard let data = data else { return }
            view.getData(data: data)
        })
    }
    
    func convertDataToModel(dto: CryptoDTO) -> [CurrencyListViewModel] {
        var entity = [CurrencyListViewModel]()
        let int = dto.data.count - 1
        for i in 0...int {
            var model = CurrencyListViewModel(from: dto.data[i])
            model.image = URL(string:  NetworkService.Endpoints.url1 + model.currencyShortName.lowercased() + NetworkService.Endpoints.url2)
            entity.append(model)
        }
        return entity
    }
//
//    func setIcons(coinName: String, entity: CurrencyListViewModel) -> CurrencyListViewModel {
//        var imageEntity = entity
//        interactor?.loadImage(coinName: coinName, completion: { imageData in
////            guard let imageData = imageData else { return }
//            imageEntity.image = imageData
//        })
//        return imageEntity
//    }
    
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
//self.interactor?.loadImage(coinName: model.currencyShortName, completion: { data in
//    model.image = data
//    print(model.image)
//})
