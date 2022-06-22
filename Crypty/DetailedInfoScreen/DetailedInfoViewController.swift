//
//  DetailedInfoViewController.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation
import UIKit

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
        configureNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureNavBar() {
//        navigationItem.hidesSearchBarWhenScrolling = true
        navigationItem.titleView?.backgroundColor = Colors.backgroundBlue.value
        navigationController?.navigationBar.tintColor = .white
        navigationItem.titleView?.tintColor = Colors.purple.value
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "yellowStar"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addToFav))
        
        
    }
    @objc func addToFav() {
        
    }
}


extension DetailedInfoViewController {
}
