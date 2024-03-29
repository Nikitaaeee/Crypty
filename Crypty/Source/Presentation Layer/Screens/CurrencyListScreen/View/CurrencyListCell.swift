//
//  CurrencyListCell.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

final class CurrencyListCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let id = String(describing: CurrencyListCell.self)
    
    //MARK: - Views
    
    private let coinImageBackroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blueGray.value
        view.alpha = 1
        view.layer.cornerRadius = Constants.imageBackgroundCornerRadius
        view.clipsToBounds = true
        return view
    }()
    
    private let coinImageView: LoadableImageView = {
        let imageView = LoadableImageView()
        imageView.image = UIImage(named: Constants.defaultImage)
        return imageView
    }()
    
    private let shortNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium14.font
        label.textAlignment = .left
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium12.font
        label.textAlignment = .left
        label.textColor = .lightGray
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium14.font
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium12.font
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Configure

extension CurrencyListCell {
    func showData(_ model: CurrencyListViewModel) {
        self.shortNameLabel.text = model.currencyShortName
        self.fullNameLabel.text = model.currencyFullName
        self.priceLabel.text = model.price
        self.percentLabel.text = String(format: "%.3f", model.percent)
        checkDiff(for: model.percent)
        self.coinImageView.url = model.image
    }
}

//MARK: - Private

private extension CurrencyListCell {
    func checkDiff(for percent: Double) {
        if percent < .zero {
            percentLabel.textColor = .red
        } else if percent > .zero {
            percentLabel.textColor = .green
        } else {
            percentLabel.textColor = .white
        }
    }
    
    func setupCell() {
        self.contentView.backgroundColor = .clear
    }
    
    func setupLayout() {
        self.configureBackgroundImageViewConstraints()
        self.configureCoinImageViewConstraints()
        self.configureShortNameLabelConstraints()
        self.configureFullNameLabelConstraints()
        self.configurePriceLabelConstraints()
        self.configurePercentLabelConstraints()
    }
    
    func configureBackgroundImageViewConstraints() {
        self.contentView.addSubview(coinImageBackroundView)
        self.coinImageBackroundView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.height.equalTo(Constants.imageBackgroundSize)
            make.leading.equalToSuperview().offset(Constants.imageLeadingOffset)
        }
    }
    
    func configureCoinImageViewConstraints() {
        self.coinImageBackroundView.addSubview(coinImageView)
        self.coinImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(Constants.topBottomInset)
            make.leading.trailing.equalToSuperview().inset(Constants.topBottomInset)
        }
    }
    
    func configureShortNameLabelConstraints() {
        self.contentView.addSubview(shortNameLabel)
        self.shortNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.coinImageBackroundView.snp.top)
            make.leading.equalTo(self.coinImageBackroundView.snp.trailing).offset(Constants.nameOffset)
            make.width.equalTo(Constants.shortNameWidth)
            make.height.equalTo(Constants.shortNameHeight)
        }
    }
    
    func configureFullNameLabelConstraints() {
        self.contentView.addSubview(fullNameLabel)
        self.fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.shortNameLabel.snp.bottom)
            make.leading.equalTo(self.coinImageBackroundView.snp.trailing).offset(Constants.nameOffset)
            make.height.equalTo(Constants.fullNameHeight)
            make.width.equalTo(Constants.fullnameWidth)
        }
    }
    
    func configurePriceLabelConstraints() {
        self.contentView.addSubview(priceLabel)
        self.priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.shortNameLabel.snp.top)
            make.leading.equalTo(self.shortNameLabel.snp.trailing)
            make.trailing.equalToSuperview().inset(Constants.pricePercentTrailingOffset)
            make.height.equalTo(Constants.shortNameHeight)
        }
    }
    
    func configurePercentLabelConstraints() {
        self.contentView.addSubview(percentLabel)
        self.percentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.priceLabel.snp.bottom)
            make.leading.equalTo(self.fullNameLabel.snp.trailing)
            make.trailing.equalToSuperview().inset(Constants.pricePercentTrailingOffset)
            make.height.equalTo(Constants.fullNameHeight)
        }
    }
}

//MARK: - Constants

private extension CurrencyListCell {
    enum Constants {
        static let currencyImageSize: CGFloat = 40
        static let imageBackgroundSize: CGFloat = 50
        static let imageBackgroundCornerRadius: CGFloat = 25
        static let topBottomInset: CGFloat = 5
        static let imageLeadingOffset: CGFloat = 20
        static let pricePercentTrailingOffset: CGFloat = 20
        static let nameOffset: CGFloat = 5
        static let shortNameWidth: CGFloat = 76
        static let shortNameHeight: CGFloat = 25
        static let fullNameHeight: CGFloat = 15
        static let fullnameWidth: CGFloat = 100
        static let defaultImage: String = "NoImage"
    }
}
