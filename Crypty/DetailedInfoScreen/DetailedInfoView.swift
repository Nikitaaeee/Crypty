//
//  DetailedView.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

protocol IDetailedInfoView: AnyObject {
    var requestCryptoData: ((String) -> Void)? { get set }

}

final class DetailedInfoView: UIView {
    public var data: CurrencyListViewModel?
    var requestCryptoData: ((String) -> Void)?

    private let fullCryptoNameLabel: UILabel = {
        let label = UILabel()
        label.font = AppFonts.bold30.font
        label.text = "fff"
        label.backgroundColor = Colors.backgroundBlue.value
        label.textColor = .white
        return label
    }()
    
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .purple

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailedInfoView: IDetailedInfoView {
    
}
