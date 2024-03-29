//
//  CurrencyListViewController.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

final class CurrencyListViewController: UIViewController {
    
    //MARK: - Properties
    
    private let presenter: CurrencyListPresenter?
    private let currencyView = CurrencyListView()
    
    //MARK: - Lifecycle
    
    init(presenter: CurrencyListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
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
        configuraNavController()
        configureTapOnRow()
    }
}

//MARK: - Private

private extension CurrencyListViewController {
    func configuraNavController() {
        let backImage = UIImage(named: "Back")
        navigationController?.navigationBar.barTintColor = Colors.purple.value
        navigationItem.backButtonTitle = ""
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        navigationItem.leftItemsSupplementBackButton = true
    }
    
    func configureTapOnRow() {
        self.currencyView.didSelectRowAt = { [weak self] id in
            self?.presenter?.goToSelecterRow(for: id)
        }
        
        self.currencyView.didTapFavoriteButton = { [weak self] isFavoriteChecked in
            self?.presenter?.didTapFavoriteButton(isFavoriteChecked: isFavoriteChecked)
        }
    }
}

