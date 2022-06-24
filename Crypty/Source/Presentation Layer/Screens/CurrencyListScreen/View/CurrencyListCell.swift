//
//  CurrencyListCell.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

class CurrencyListCell: UITableViewCell {
    
    static let id = String(describing: CurrencyListCell.self)
    
    private enum Constants {
        static let currencyImageSize = 40
        static let imageBackgroundSize = 50
        static let imageBackgroundCornerRadius: CGFloat = 25
        
        static let topBottomInset = 5
        static let imageLeadingOffset = 20
        static let pricePercentTrailingOffset = 20
        static let nameOffset = 5
        static let shortNameWidth = 76
        static let shortNameHeight = 25
        static let fullNameHeight = 15
        static let fullnameWidth = 100
    }
    
    private let coinImageBackroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blueGray.value
        view.alpha = 1
        view.layer.cornerRadius = Constants.imageBackgroundCornerRadius
        view.clipsToBounds = true
//        view.layer.borderColor = view.whiteColor().CGColor
//        view.layer.borderWidth = 5.0
        return view
    }()
    
    private let coinImageView: LoadableImageView = {
        let imageView = LoadableImageView()
        imageView.image = UIImage(named: "NoImage")
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CurrencyListCell {
    func showData(_ model: CurrencyListViewModel) {
        self.shortNameLabel.text = model.currencyShortName
        self.fullNameLabel.text = model.currencyFullName
        self.priceLabel.text = model.price
        self.percentLabel.text = model.percent
        checkDiff(for: model.percent)
        self.coinImageView.url = model.image
    }
    
    func checkForImageUrlExistance(url: URL) {
        
    }
    
    func checkDiff(for percent: String) {
        let percentDouble = Double(percent)
        guard let percentDouble = percentDouble else { return }
        if percentDouble < 0 {
            percentLabel.textColor = .red
        } else if percentDouble > 0 {
            percentLabel.textColor = .green
        } else {
            percentLabel.textColor = .white
        }
    }

}


private extension CurrencyListCell {
    
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
//            make.top.bottom.equalToSuperview()
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
