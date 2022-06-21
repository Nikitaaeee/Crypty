//
//  CurrencyListView.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import Foundation
import UIKit

protocol ICurrencyListView: AnyObject {
    func getData(data: [CurrencyListViewModel])
    var didSelectRowAt: ((Int) -> ())? { get set }
}

final class CurrencyListView: UIView {
    
    public var data: [CurrencyListViewModel]?
    private var tableView = UITableView()
    var didSelectRowAt: ((Int) -> ())?
    var dataSource = CurrencyListDataSoruce()
    
    private enum Constants {
        static let marketLabelHeight = 64
        static let marketLabelOffset = 20
        static let sortButtonTrailing = 10
        static let sortButtonLeading = 50
        static let sortButtonHeight = 22
        static let sortButtonCornerRadius: CGFloat = 12
    }
    
    private enum Texts {
        static let marketLabelText = "Markets:"
    }
    
    private let marketLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.bold30.font
        label.text = Texts.marketLabelText
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    
    private let sortButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Constants.sortButtonCornerRadius
        button.backgroundColor = Colors.backgroundAlmostBlack.value
        button.setTitle("Hot↓", for: .normal)
        button.titleLabel?.font =  AppFonts.semibold16.font
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.backgroundColor = Colors.backgroundBlue.value
        setupMarketLabel()
        setupSortButtonConstraints()
        setupTableViewConstraints()
    }
    
    func setupMarketLabel() {
        self.addSubview(self.marketLabel)
        self.marketLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide)
            make.trailing.leading.equalToSuperview().inset(Constants.marketLabelOffset)
            make.height.equalTo(Constants.marketLabelHeight)
        }
    }
    
    func setupSortButtonConstraints() {
        self.addSubview(self.sortButton)
        self.sortButton.snp.makeConstraints { make in
            make.top.equalTo(self.marketLabel.snp.bottom)
            make.leading.equalTo(marketLabel.snp.trailing).inset(Constants.sortButtonLeading)
            make.trailing.equalToSuperview().inset(Constants.sortButtonTrailing)
            make.height.equalTo(Constants.sortButtonHeight)
        }
    }
    
    func setupTableViewConstraints() {
        self.addSubview(self.tableView)
        self.tableView.backgroundColor = Colors.backgroundBlue.value
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.sortButton.snp.bottom)
            make.bottom.equalTo(self)
            make.leading.trailing.equalToSuperview()
        }
    }
        
    func configureTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = dataSource
        self.tableView.separatorStyle = .none
        self.tableView.register(CurrencyListCell.self, forCellReuseIdentifier: CurrencyListCell.id)
    }
}

extension CurrencyListView: ICurrencyListView {
    func getData(data: [CurrencyListViewModel]) {
        self.dataSource.data = data
        tableView.reloadData()
    }
}

extension CurrencyListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destVC = DetailedInfoAssembly.build()
        if let currency = data?[indexPath.row].currencyShortName {
            destVC.currency = currency
        }
    }
}
