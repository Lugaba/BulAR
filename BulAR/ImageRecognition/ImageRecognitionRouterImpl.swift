//
//  ImageRecognitionRouter.swift
//  BulAR
//
//  Created by Luca Hummel on 24/07/23.
//

import Foundation
import UIKit

class ImageRecognitionRouterImpl: ImageRecognitionRouter {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func navigateToSearch(bulas: [Bula]) {
        let viewController = TableSearchFactory.makeController(navigationController: navigationController, bulas: bulas)
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func navigateToBula(bula: Bula) {
        let viewController = MedicineDetailsFactory.makeController(bula: bula, navigationController: navigationController)
        
        navigationController?.present(viewController, animated: true)
    }
}
