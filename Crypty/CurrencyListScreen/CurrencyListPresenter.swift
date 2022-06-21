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
        let data: [CurrencyListViewModel]?
        self.view = view
        data = interactor?.getData()
        if let data = data {
            self.view?.getData(data: data)
        }
    }
    func goToSelecterRow(for currency: String) {
        router?.goToSelecterRow(for: currency)
    }
}
