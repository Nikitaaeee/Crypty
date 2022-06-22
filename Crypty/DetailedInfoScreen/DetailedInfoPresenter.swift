//
//  DetailedInfoPresenter.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation

protocol IDetailedInfoPresenter: AnyObject {
    func viewDidLoad(view: IDetailedInfoView)

}

final class DetailedInfoPresenter {
    private var view: IDetailedInfoView?
    private var interactor : IDetailedInfoInteractor?
    private var router: IDetailedInfoRouter?
    private var currentWeatherViewModel: DetailedInfoViewModel?
    
    init(interactor: IDetailedInfoInteractor, router: IDetailedInfoRouter) {
        self.interactor = interactor
        self.router = router
    }
}

extension DetailedInfoPresenter: IDetailedInfoPresenter {
    func viewDidLoad(view: IDetailedInfoView) {
        let data: DetailedInfoViewModel?
        self.view = view
        data = interactor?.getData()
        if let data = data {
            self.view?.getData(data: data)
        }
    }
}
