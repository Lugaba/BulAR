//
//  TableSearchPresenterImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class MedicineDetailsPresenterImpl: MedicineDetailsPresenter {
    
    private var viewController: MedicineDetailsViewController
    
    init(viewController: MedicineDetailsViewController) {
        self.viewController = viewController
    }

    func showMedicineDetails(bula: Bula) {
        viewController.showMedicineDetails(bula: bula)
    }
}
