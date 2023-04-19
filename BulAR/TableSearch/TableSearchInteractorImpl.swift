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
}
