//
//  CurrencyListPresenter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol ICurrencyListPresenter: AnyObject {
    func viewDidLoad(view: ICurrencyListView)
}

class CurrencyListPresenter {
    private var view: ICurrencyListView?
    private var interactor : ICurrencyListInteractor?
    private var router: ICurrencyListRouter?
    private var currentWeatherViewModel: CurrencyListViewModel?

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
            data = self.convertDataToModel(dto: model)
            guard let data = data else { return }
            view.getData(data: data)
        })
    }
    
    func convertDataToModel(dto: CryptoDTO) -> [CurrencyListViewModel] {
        var entity = [CurrencyListViewModel]()
        let int = dto.data.count - 1
        for i in 0...int {
            entity.append(CurrencyListViewModel(from: dto.data[i]))
        }
        return entity
    }
    
    func goToSelecterRow(for currency: String) {
        router?.goToSelecterRow(for: currency)
    }
}
