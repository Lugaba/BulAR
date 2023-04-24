//
//  TableSearchRouterImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class TableSearchRouterImpl: TableSearchRouter {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func goToMedicineDetails(bula: Bula) {
        let viewController = MedicineDetailsFactory.makeController(bula: bula, navigationController: navigationController)
        
        navigationController?.present(viewController, animated: true)
    }
}
