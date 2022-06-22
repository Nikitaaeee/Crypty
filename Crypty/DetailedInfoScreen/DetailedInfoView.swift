//
//  DetailedView.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

protocol IDetailedInfoView: AnyObject {
    func getData(data: DetailedInfoViewModel)
}

final class DetailedInfoView: UIView {
    public var data: CurrencyListViewModel?
    var requestCryptoData: ((String) -> Void)?
    let contentView = UIView()
    var scrollView = UIScrollView()

    
    enum Constants {
        static let priceLabelWidth = 100
        static let smallSeparatorOffset = 20
        static let separatorOffset = 36
        static let bigSeparatorOFfset = 56
        static let leadingOffset = 20
        static let topPriceOffset = 20
        static let priceHeight = 28
        static let topPercentOffset = 5
        static let percentHeight = 15
        static let topCoinPerformanceOffset = 20
        static let coinPerformanceHeight = 28
        
        static let separatorViewOffset = 10
        static let separatorViewHeight = 1
        static let separatorViewLeadingTrailingOFfset = 20
        
        static let highLow24Height = 20
        static let highLow24Width = 100
        static let highLow24Offset = 30
        static let rankLabelHeight = 50
        
        static let coinBackgroundImageWidthHeight = 50
        static let imageBackgroundCornerRadius: CGFloat = 25
        static let crownWidthHeight = 36
//        static let crownLabelsWidth = 130
        static let leftStackTopOffset = 8
        static let leftStackWidth = 180
        static let allTimeTopPriceWidth = 80
        
        static let stackViewSpacing: CGFloat  = 20
//        static let rankNumberOffset = 5
    }
    
    enum Texts {
        static let coinPerformanceLabel = "Coin Performance"
        static let high24Label = "24H High"
        static let low24Label = "24H Low"
        static let rankLabel = "Rank"
        static let allTimeHighLabel = "All Time High:"
        static let atLabelText = "at:"
        static let daysSinceLabelText = "days since:"
        static let percentDownLabelText = "percent down:"
        static let descriptionLabelText = "Currency info:"
    }
    
    init() {
        super.init(frame: .zero)
        setupScrollView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular24.font
        label.text = "$0,000.01"
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let percentLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular16.font
        label.text = "+0.04%"
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .systemGreen
        return label
    }()
    private let coinPerformanceLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = Texts.coinPerformanceLabel
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let high24Label: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular20.font
        label.text = Texts.high24Label
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let priceHigh24Label: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = "$0,000.01"
        label.textAlignment = .right
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .lightGray
        return label
    }()
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    private let low24Label: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular20.font
        label.text = Texts.low24Label
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let priceLow24Label: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = "$0,000.01"
        label.textAlignment = .right
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .lightGray
        return label
    }()
    private let rankLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular16.font
        label.text = Texts.rankLabel
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let coinImageBackroundView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.blueGray.value
        view.alpha = 1
        view.layer.cornerRadius = Constants.imageBackgroundCornerRadius
        view.clipsToBounds = true
        return view
    }()
    private let rankNumberLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = "$0,000.01"
        label.textColor = Colors.purple.value
        label.textAlignment = .center
        return label
    }()
    private let crownImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Crown")
        return imageView
    }()
    private let allTimeHighLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = Texts.allTimeHighLabel
        label.textAlignment = .right
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let allTimeHignNumberLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium20.font
        label.text = "$ 32856,92"
        label.backgroundColor = Colors.backgroundBlue.value
        label.textAlignment = .right
        label.textColor = .lightGray
        return label
    }()
    private let atLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular16.font
        label.text = Texts.atLabelText
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let atNumberLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium16.font
        label.text = "1"
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .lightGray
        return label
    }()
    private let daysSinceLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular16.font
        label.text = Texts.daysSinceLabelText
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let daysSinceNumberLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium16.font
        label.text = "1"
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .lightGray
        return label
    }()
    private let percentDownLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.regular16.font
        label.text = Texts.percentDownLabelText
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let percentDownNumberLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.medium16.font
        label.text = "1"
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .lightGray
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Constants.stackViewSpacing
        stack.alignment = .trailing
        stack.distribution = .fillEqually
        [self.allTimeHighLabel,
         self.atLabel,
         self.daysSinceLabel,
         self.percentDownLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    lazy var numbersStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Constants.stackViewSpacing
        stack.alignment = .trailing
        stack.distribution = .fillEqually
        [self.allTimeHignNumberLabel,
         self.atNumberLabel,
         self.daysSinceNumberLabel,
         self.percentDownNumberLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = AppFonts.medium20.font
        label.text = Texts.descriptionLabelText
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    private let descriptionLabelText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = AppFonts.medium16.font
        label.text = LargeText.label
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .lightGray
        return label
    }()
    
}

extension DetailedInfoView: IDetailedInfoView {
    
    func getData(data: DetailedInfoViewModel) {
        self.priceLabel.text = data.price
        self.percentLabel.text = data.percent
        self.priceHigh24Label.text = data.high24
        self.priceLow24Label.text = data.low24
        self.rankNumberLabel.text = String(data.rating)
    }

}

private extension DetailedInfoView {
    
    func setupLayout() {
        self.backgroundColor = Colors.backgroundBlue.value
        configurePriceLabel()
        configurePercentLabel()
        configureCoinPerformanceLabel()
        configureHigh24Label()
        configureHigh24NumberLabel()
        configureSeparatorView()
        configureLow24Label()
        configureLow24NumberLabel()
        configureRankLabel()
        configureCoinBackgroundView()
        configureRankNumber()
        configureCrownImage()
        configureStackView()
        configureNumbersStackView()
        configureDescriptionLabel()
        configureDescriptionLabelText()
        
    }
    
    
    func configurePriceLabel() {
        contentView.addSubview(priceLabel)
        self.priceLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.safeAreaLayoutGuide).offset(Constants.separatorOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.leadingOffset)
            make.height.equalTo(Constants.priceHeight)
        }
    }
    func configurePercentLabel() {
        contentView.addSubview(percentLabel)
        self.percentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.priceLabel.snp.bottom).offset(Constants.topPercentOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.leadingOffset)
            make.height.equalTo(Constants.percentHeight)
        }
    }
    func configureCoinPerformanceLabel() {
        contentView.addSubview(coinPerformanceLabel)
        self.coinPerformanceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.percentLabel.snp.bottom).offset(Constants.separatorOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.leadingOffset)
            make.height.equalTo(Constants.priceHeight)
        }
    }
    func configureHigh24Label() {
        contentView.addSubview(high24Label)
        self.high24Label.snp.makeConstraints { make in
            make.top.equalTo(self.coinPerformanceLabel.snp.bottom).offset(Constants.separatorOffset)
            make.leading.equalToSuperview().offset(Constants.highLow24Offset)
            make.trailing.equalTo(contentView.snp.centerX)
//            make.width.equalTo(Constants.highLow24Width)
            make.height.equalTo(Constants.highLow24Height)
        }
    }
    func configureHigh24NumberLabel() {
        contentView.addSubview(priceHigh24Label)
        self.priceHigh24Label.snp.makeConstraints { make in
            make.top.equalTo(self.coinPerformanceLabel.snp.bottom).offset(Constants.separatorOffset)
            make.leading.equalTo(high24Label.snp.trailing)
            make.trailing.equalToSuperview().inset(Constants.highLow24Offset)
            make.height.equalTo(Constants.highLow24Height)
        }
    }
    func configureSeparatorView() {
        contentView.addSubview(separatorView)
        self.separatorView.snp.makeConstraints { make in
            make.top.equalTo(high24Label.snp.bottom).offset(Constants.separatorViewOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.separatorViewLeadingTrailingOFfset)
            make.height.equalTo(Constants.separatorViewHeight)
        }
    }
    func configureLow24Label() {
        contentView.addSubview(low24Label)
        self.low24Label.snp.makeConstraints { make in
            make.top.equalTo(self.separatorView.snp.bottom).offset(Constants.separatorViewOffset)
            make.leading.equalToSuperview().offset(Constants.highLow24Offset)
            make.trailing.equalTo(self.scrollView.snp.centerX)
//            make.width.equalTo(Constants.highLow24Width)
            make.height.equalTo(Constants.highLow24Height)
        }
    }
    func configureLow24NumberLabel() {
        contentView.addSubview(priceLow24Label)
        self.priceLow24Label.snp.makeConstraints { make in
            make.top.equalTo(self.separatorView.snp.bottom).offset(Constants.separatorViewOffset)
            make.leading.equalTo(low24Label.snp.trailing)
            make.trailing.equalToSuperview().inset(Constants.highLow24Offset)
            make.height.equalTo(Constants.highLow24Height)
        }
    }
    func configureRankLabel(){
        contentView.addSubview(rankLabel)
        self.rankLabel.snp.makeConstraints { make in
            make.top.equalTo(self.low24Label.snp.bottom).offset(Constants.separatorOffset)
            make.leading.equalToSuperview().offset(Constants.highLow24Offset)
            make.trailing.equalTo(self.scrollView.snp.centerX)
            make.height.equalTo(Constants.rankLabelHeight)
        }
    }
    func configureCoinBackgroundView() {
        contentView.addSubview(self.coinImageBackroundView)
        self.coinImageBackroundView.snp.makeConstraints { make in
            make.top.equalTo(self.priceLow24Label.snp.bottom).offset(Constants.separatorOffset)
            make.trailing.equalToSuperview().inset(Constants.highLow24Offset)
            make.width.equalTo(Constants.coinBackgroundImageWidthHeight)
            make.height.equalTo(Constants.coinBackgroundImageWidthHeight)
        }
    }
    func configureRankNumber() {
        coinImageBackroundView.addSubview(rankNumberLabel)
        self.rankNumberLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
    func configureCrownImage() {
        contentView.addSubview(crownImageView)
        self.crownImageView.snp.makeConstraints { make in
            make.top.equalTo(self.rankLabel.snp.bottom).offset(Constants.bigSeparatorOFfset)
            make.leading.equalToSuperview().offset(Constants.highLow24Offset)
            make.height.width.equalTo(Constants.crownWidthHeight)
        }
    }
    func configureStackView() {
        contentView.addSubview(labelStackView)
        self.labelStackView.snp.makeConstraints { make in
            make.top.equalTo(self.crownImageView.snp.top).offset(Constants.leftStackTopOffset)
            make.leading.equalTo(self.crownImageView.snp.trailing)
            make.width.equalTo(Constants.leftStackWidth)
            make.height.equalTo(200)

        }
    }
    func configureNumbersStackView() {
        contentView.addSubview(numbersStackView)
        self.numbersStackView.snp.makeConstraints { make in
            make.top.equalTo(crownImageView.snp.top).offset(Constants.leftStackTopOffset)
            make.leading.equalTo(labelStackView.snp.trailing)
            make.trailing.equalTo(priceLow24Label.snp.trailing)
            make.height.equalTo(200)
        }
    }
    
    func configureDescriptionLabel() {
        contentView.addSubview(descriptionLabel)
        self.descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(self.labelStackView.snp.bottom).offset(Constants.smallSeparatorOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.separatorOffset)
            make.height.equalTo(Constants.coinPerformanceHeight)
        }
    }
    
    func configureDescriptionLabelText() {
        contentView.addSubview(descriptionLabelText)
        self.descriptionLabelText.snp.makeConstraints { make in
            make.top.equalTo(self.descriptionLabel.snp.bottom).offset(Constants.smallSeparatorOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.separatorOffset)
            make.bottom.equalToSuperview()
        }
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
}
