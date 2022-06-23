//
//  Coordinator.swift
//  Crypty
//
//  Created by Nikita Kirshin on 23.06.2022.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
