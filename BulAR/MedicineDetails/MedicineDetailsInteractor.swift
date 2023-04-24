//
//  TableSearchInteractorImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class MedicineDetailsInteractorImpl: MedicineDetailsInteractor {
    private var presenter: MedicineDetailsPresenter
    private var bula: Bula
    
    init(presenter: MedicineDetailsPresenter, bula: Bula) {
        self.presenter = presenter
        self.bula = bula
    }
    
    func showMedicineDetails() {
        presenter.showMedicineDetails(bula: self.bula)
    }
}
