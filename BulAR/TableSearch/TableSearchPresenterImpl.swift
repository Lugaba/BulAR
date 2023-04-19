//
//  TableSearchPresenterImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class TableSearchPresenterImpl: TableSearchPresenter {
    
    private var viewController: TableSearchViewController
    
    init(viewController: TableSearchViewController) {
        self.viewController = viewController
    }
    
    func showMedicineList(list: [Bula]) {
        viewController.showMedicineList(list: list)
    }
}
