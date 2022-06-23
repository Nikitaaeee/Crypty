//
//  CurrencyListDataSource.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

class CurrencyListDataSoruce: NSObject {
    var data = [CurrencyListViewModel]()
}

extension CurrencyListDataSoruce: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyListCell.id, for: indexPath) as? CurrencyListCell else { return UITableViewCell() }
        cell.showData(data[indexPath.row])
        cell.backgroundColor = Colors.backgroundBlue.value
        return cell
    }    
}
