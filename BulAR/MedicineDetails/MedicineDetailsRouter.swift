//
//  MedicineDetailsRouter.swift
//  BulAR
//
//  Created by Luca Hummel on 24/04/23.
//

import Foundation
import UIKit

class MedicineDetailsRouterImpl: MedicineDetailsRouter {
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    func closeModal() {
        navigationController?.dismiss(animated: true)
    }
}
