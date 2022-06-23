//
//  CurrencyListViewController.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

final class CurrencyListViewController: UIViewController {
    
    private var presenter: CurrencyListPresenter?
    private var router = CurrencyListRouter()
    private var currencyView = CurrencyListView()
    
    init(presenter: CurrencyListPresenter) {
        super.init(nibName: nil, bundle: nil)
        self.presenter = presenter
        presenter.viewDidLoad(view: currencyView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configuraNavController() {
        let backImage = UIImage(named: "Back")
        self.navigationController?.navigationBar.backIndicatorImage = backImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
        
        navigationItem.leftItemsSupplementBackButton = true

//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
    }
    
    override func loadView() {
        self.view = currencyView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraNavController()
        configureTapOnRow()
        
    }
    
    func configureTapOnRow() {
        self.currencyView.didSelectRowAt = { [weak self] id in
            self?.presenter?.goToSelecterRow(for: id)
        }
    }
    
}


