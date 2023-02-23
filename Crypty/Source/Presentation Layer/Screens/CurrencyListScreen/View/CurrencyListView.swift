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
    var didSelectRowAt: ((String) -> ())? { get set }
    var didTapFavoriteButton: ((Bool) -> Void)? { get set }
    var didTapSortButton: ((Bool) -> Void)? { get set }
}

final class CurrencyListView: UIView {
    
    //MARK: - Properties
    
    private var isFavoriteChecked = false
    private var isSortedPressed = false
    private var tableView = UITableView()
    
    var data: [CurrencyListViewModel]?
    var didSelectRowAt: ((String) -> ())?
    var didTapFavoriteButton: ((Bool) -> Void)?
    var didTapSortButton: ((Bool) -> Void)?
    var dataSource = CurrencyListDataSoruce()
    
    //MARK: - Views
    
    private let marketLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.bold30.font
        label.text = Texts.marketLabelText
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    
    private lazy var favButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Constants.sortButtonCornerRadius
        button.backgroundColor = Colors.backgroundAlmostBlack.value
        button.setTitle("★", for: .normal)
        button.addTarget(self, action: #selector(didTapFavoriteButton(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var sortButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = Constants.sortButtonCornerRadius
        button.backgroundColor = Colors.backgroundAlmostBlack.value
        button.setTitle("Percent ↓", for: .normal)
        button.addTarget(self, action: #selector(didTapSortButton(_:)), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    init() {
        super.init(frame: .zero)
        setupView()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private

private extension CurrencyListView {
    func setupView() {
        self.backgroundColor = Colors.backgroundBlue.value
        setupMarketLabel()
        setupSortButtonConstraints()
        setupFavButtonConstraints()
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
            make.trailing.equalToSuperview().inset(Constants.sortButtonTrailing)
            make.width.equalTo(Constants.sortButtonWidth)
            make.height.equalTo(Constants.sortButtonHeight)
        }
    }
    
    func setupFavButtonConstraints() {
        self.addSubview(self.favButton)
        self.favButton.snp.makeConstraints { make in
            make.top.equalTo(self.marketLabel.snp.bottom)
            make.leading.equalToSuperview().offset(Constants.sortButtonTrailing)
            make.width.equalTo(Constants.favBtnWidth)
            make.height.equalTo(Constants.sortButtonHeight)
        }
    }
    
    func setupTableViewConstraints() {
        self.addSubview(self.tableView)
        self.tableView.backgroundColor = Colors.backgroundBlue.value
        self.tableView.snp.makeConstraints { make in
            make.top.equalTo(self.favButton.snp.bottom)
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
        
    @objc
    func didTapFavoriteButton(_ sender: UIButton) {
        isFavoriteChecked.toggle()
        
        if isFavoriteChecked {
            sender.backgroundColor = .white
            sender.setTitleColor(Colors.backgroundAlmostBlack.value, for: .normal)
        } else {
            sender.backgroundColor = Colors.backgroundAlmostBlack.value
            sender.setTitleColor(.white, for: .normal)
        }
        didTapFavoriteButton?(isFavoriteChecked)
    }
    
    @objc
    func didTapSortButton(_ sender: UIButton) {
        isSortedPressed.toggle()
        if isSortedPressed {
            dataSource.isSortedAsc = isSortedPressed
            sender.setTitle(Texts.sortedUpText, for: .normal)
        } else {
            dataSource.isSortedAsc = isSortedPressed
            sender.setTitle(Texts.sortedDownText, for: .normal)
        }
        tableView.reloadData()
    }
}

//MARK: - ICurrencyListView

extension CurrencyListView: ICurrencyListView {
    func getData(data: [CurrencyListViewModel]) {
        self.dataSource.data = data
        tableView.reloadData()
    }
}

//MARK: - UITableViewDelegate

extension CurrencyListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let id = dataSource.data[indexPath.row].id
        didSelectRowAt?(id)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.tableViewCellHeight
    }
}

//MARK: - Constants

private extension CurrencyListView {
    enum Constants {
        static let buttonWidth: CGFloat = 40
        static let marketLabelHeight: CGFloat = 50
        static let marketLabelOffset: CGFloat = 20
        static let sortButtonTrailing: CGFloat = 10
        static let buttonsOffset: CGFloat = 100
        static let sortButtonLeading: CGFloat = 50
        static let sortButtonHeight: CGFloat = 30
        static let sortButtonCornerRadius: CGFloat = 12
        static let sortButtonWidth: CGFloat = 100
        static let favBtnWidth: CGFloat = 30
        static let tableViewCellHeight: CGFloat = 70
    }
    
    enum Texts {
        static let marketLabelText: String = "Markets:"
        static let sortedUpText: String = "Percent ↑"
        static let sortedDownText: String = "Percent ↓"
    }
}
