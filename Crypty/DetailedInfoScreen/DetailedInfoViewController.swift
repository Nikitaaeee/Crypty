//
//  DetailedInfoViewController.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation
import UIKit

protocol IDetailedInfoViewController: AnyObject {
    
}

final class DetailedInfoViewController: UIViewController {
    var currency: String?
    
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
}

extension DetailedInfoViewController: IDetailedInfoViewController {
    
}
