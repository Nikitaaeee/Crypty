//
//  CurrencyListDataSource.swift
//  Crypty
//
//  Created by Nikita Kirshin on 21.06.2022.
//

import UIKit

class CurrencyListDataSoruce: NSObject {
    var data = [CurrencyListViewModel]()
    var isSortedAsc = false
//    var sortedArray = [CurrencyListViewModel]()
}

extension CurrencyListDataSoruce: UITableViewDataSource {
    
    func sortData(sortedAsc: Bool) -> [CurrencyListViewModel] {
        if sortedAsc {
            data.sort { $0.percent < $1.percent }
        } else {
            data.sort { $0.percent > $1.percent }
        }
        return data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CurrencyListCell.id, for: indexPath) as? CurrencyListCell else { return UITableViewCell() }
        cell.showData(sortData(sortedAsc: isSortedAsc)[indexPath.row])
        cell.backgroundColor = Colors.backgroundBlue.value
        return cell
    }
}
