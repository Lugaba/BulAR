//
//  TableSearchInteractorImpl.swift
//  BulAR
//
//  Created by Luca Hummel on 19/04/23.
//

import Foundation
import UIKit

class TableSearchInteractorImpl: TableSearchInteractor {
    private var presenter: TableSearchPresenter
    private var router: TableSearchRouter
    private var worker: TableSearchWorker
    
    init(presenter: TableSearchPresenter, router: TableSearchRouter, worker: TableSearchWorker) {
        self.presenter = presenter
        self.router = router
        self.worker = worker
    }
    
    func getMedicineList() {
        worker.fetchMedicineList { [weak self] bulas, error in
            if let bulas = bulas {
                self?.presenter.showMedicineList(list: bulas)
                print(bulas[0].categorias)
            }
        }
    }
    
    func goToMedicineDetails(bula: Bula) {
        router.goToMedicineDetails(bula: bula)
    }
}
