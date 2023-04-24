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
    private var router: MedicineDetailsRouter
    private var bula: Bula
    
    init(presenter: MedicineDetailsPresenter, router: MedicineDetailsRouter, bula: Bula) {
        self.presenter = presenter
        self.router = router
        self.bula = bula
        
        print(bula)
    }
}
