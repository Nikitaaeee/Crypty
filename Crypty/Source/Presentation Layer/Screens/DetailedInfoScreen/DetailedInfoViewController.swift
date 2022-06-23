//
//  DetailedInfoViewController.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation
import UIKit

final class DetailedInfoViewController: UIViewController {
    
    static var coinName: String = ""
    
    private var presenter: DetailedInfoPresenter?
    private var router = DetailedInfoRouter()
    private var currencyView = DetailedInfoView()
    
    init(presenter: DetailedInfoPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        presenter.viewDidLoad(view: currencyView)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = currencyView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
}


extension DetailedInfoViewController {
    func configureView() {
        currencyView.didTapFavoriteButton = { [weak self] in
            self?.presenter?.didTapFavoriteButton()
        }
//        currencyView.data = dto?.data
    }
}
