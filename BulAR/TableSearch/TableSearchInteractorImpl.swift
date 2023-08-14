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
    private var worker: TableSearchWorker
    public let imageCash = GlobalCache.shared
    private var bulas: [Bula]
    
    init(presenter: TableSearchPresenter, worker: TableSearchWorker, bulas: [Bula]) {
        self.presenter = presenter
        self.worker = worker
        self.bulas = bulas
    }
    
    func getMedicineList() {
        self.presenter.showMedicineList(list: self.bulas)
    }
    
    func getMedicineImage(imageURL: String, completion: @escaping (UIImage) -> Void) {
        worker.fetchMedicineImage(imageURL: imageURL) { image, error in
            if let image = image {
                self.imageCash.setObject(image, forKey: imageURL)
                completion(image)
            }
        }
    }
}
